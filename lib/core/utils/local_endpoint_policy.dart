import 'dart:io';

/// Endpoint safety policy for local AI services.
///
/// Allowed hosts:
/// - loopback (`127.0.0.1`, `::1`, `localhost`)
/// - private LAN (optional): `10.x.x.x`, `172.16.x.x`-`172.31.x.x`,
///   `192.168.x.x`, link-local ranges and `.local` mDNS hosts.
class LocalEndpointPolicy {
  static bool isAllowed(String endpoint, {bool allowPrivateNetwork = true}) {
    final trimmed = endpoint.trim();
    if (trimmed.isEmpty) return false;
    final uri = Uri.tryParse(trimmed);
    if (uri == null) return false;
    return isAllowedUri(uri, allowPrivateNetwork: allowPrivateNetwork);
  }

  static bool isAllowedUri(Uri uri, {bool allowPrivateNetwork = true}) {
    final scheme = uri.scheme.toLowerCase();
    if (scheme != 'http' &&
        scheme != 'https' &&
        scheme != 'ws' &&
        scheme != 'wss') {
      return false;
    }

    final host = uri.host.trim().toLowerCase();
    if (host.isEmpty) return false;

    if (_isLoopbackHost(host)) return true;
    if (!allowPrivateNetwork) return false;

    if (host.endsWith('.local')) return true;

    final ip = InternetAddress.tryParse(host);
    if (ip == null) return false;

    if (ip.type == InternetAddressType.IPv4) {
      final b = ip.rawAddress;
      if (b.length != 4) return false;
      final first = b[0];
      final second = b[1];

      final isPrivate10 = first == 10;
      final isPrivate172 = first == 172 && second >= 16 && second <= 31;
      final isPrivate192 = first == 192 && second == 168;
      final isLinkLocal = first == 169 && second == 254;

      return isPrivate10 || isPrivate172 || isPrivate192 || isLinkLocal;
    }

    if (ip.type == InternetAddressType.IPv6) {
      final b = ip.rawAddress;
      if (b.length != 16) return false;
      final first = b[0];
      final second = b[1];

      // fc00::/7 unique-local or fe80::/10 link-local.
      final isUniqueLocal = (first & 0xfe) == 0xfc;
      final isLinkLocal = first == 0xfe && (second & 0xc0) == 0x80;
      return isUniqueLocal || isLinkLocal;
    }

    return false;
  }

  static String normalize(
    String endpoint, {
    required String fallback,
    bool allowPrivateNetwork = true,
  }) {
    final trimmed = endpoint.trim();
    if (isAllowed(trimmed, allowPrivateNetwork: allowPrivateNetwork)) {
      return trimmed;
    }
    return fallback;
  }

  static bool _isLoopbackHost(String host) {
    return host == '127.0.0.1' || host == 'localhost' || host == '::1';
  }
}
