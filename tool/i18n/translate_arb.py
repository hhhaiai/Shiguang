#!/usr/bin/env python3
"""
Bulk translation script for Flutter l10n arb files.
Uses Google Translate (unofficial) for translation.
"""

import json
import re
import sys
import time
from pathlib import Path

# Try to import googletrans, fall back to basic implementation
try:
    from googletrans import Translator
    TRANSLATOR = Translator()
    def translate(text, dest_lang):
        if not text or text.strip() == '':
            return text
        try:
            result = TRANSLATOR.translate(text, dest=dest_lang)
            return result.text if result else text
        except Exception as e:
            print(f"Translation error: {e}", file=sys.stderr)
            return text
except ImportError:
    # Fallback: return original text
    def translate(text, dest_lang):
        return text

# Language code mapping to Google Translate codes
LANG_MAP = {
    # Europe
    'es': 'es',  # Spanish
    'fr': 'fr',  # French
    'de': 'de',  # German
    'it': 'it',  # Italian
    'pt': 'pt-PT',  # Portuguese (Portugal)
    'pt-BR': 'pt-BR',  # Portuguese (Brazil)
    'nl': 'nl',  # Dutch
    'ru': 'ru',  # Russian
    'pl': 'pl',  # Polish
    'uk': 'uk',  # Ukrainian
    'ro': 'ro',  # Romanian
    'cs': 'cs',  # Czech
    'sk': 'sk',  # Slovak
    'hu': 'hu',  # Hungarian
    'sv': 'sv',  # Swedish
    'nb': 'no',  # Norwegian Bokmål
    'da': 'da',  # Danish
    'fi': 'fi',  # Finnish
    'el': 'el',  # Greek
    'bg': 'bg',  # Bulgarian
    'sr': 'sr',  # Serbian
    'hr': 'hr',  # Croatian
    'sl': 'sl',  # Slovenian
    'lt': 'lt',  # Lithuanian
    'lv': 'lv',  # Latvian
    'et': 'et',  # Estonian
    'ga': 'ga',  # Irish
    'cy': 'cy',  # Welsh
    'is': 'is',  # Icelandic
    'ca': 'ca',  # Catalan
    'eu': 'eu',  # Basque
    'gl': 'gl',  # Galician
    'sq': 'sq',  # Albanian
    'mt': 'mt',  # Maltese
    'mk': 'mk',  # Macedonian
    'bs': 'bs',  # Bosnian

    # East Asia
    'zh-Hans': 'zh-CN',  # Chinese Simplified
    'zh-Hant': 'zh-TW',  # Chinese Traditional
    'zh-TW': 'zh-TW',  # Chinese (Taiwan)
    'zh-HK': 'zh-HK',  # Chinese (Hong Kong)
    'ja': 'ja',  # Japanese
    'ko': 'ko',  # Korean
    'mn': 'mn',  # Mongolian

    # Southeast Asia
    'vi': 'vi',  # Vietnamese
    'th': 'th',  # Thai
    'id': 'id',  # Indonesian
    'ms': 'ms',  # Malay
    'fil': 'tl',  # Filipino
    'my': 'my',  # Burmese
    'km': 'km',  # Khmer
    'lo': 'lo',  # Lao

    # South Asia
    'hi': 'hi',  # Hindi
    'bn': 'bn',  # Bengali
    'ur': 'ur',  # Urdu
    'ta': 'ta',  # Tamil
    'te': 'te',  # Telugu
    'mr': 'mr',  # Marathi
    'gu': 'gu',  # Gujarati
    'kn': 'kn',  # Kannada
    'ml': 'ml',  # Malayalam
    'pa': 'pa',  # Punjabi
    'ne': 'ne',  # Nepali
    'si': 'si',  # Sinhala

    # Middle East & North Africa
    'ar': 'ar',  # Arabic
    'he': 'he',  # Hebrew
    'fa': 'fa',  # Persian
    'tr': 'tr',  # Turkish
    'az': 'az',  # Azerbaijani
    'hy': 'hy',  # Armenian
    'ka': 'ka',  # Georgian

    # Sub-Saharan Africa
    'sw': 'sw',  # Swahili
    'zu': 'zu',  # Zulu
    'xh': 'xh',  # Xhosa
    'yo': 'yo',  # Yoruba
    'ig': 'ig',  # Igbo
    'ha': 'ha',  # Hausa
    'am': 'am',  # Amharic
    'so': 'so',  # Somali
    'af': 'af',  # Afrikaans

    # Americas
    'ht': 'ht',  # Haitian Creole
    'qu': 'qu',  # Quechua
}

# All locales to generate
LOCALES = list(LANG_MAP.keys())

def load_arb(filepath):
    """Load ARB file"""
    with open(filepath, 'r', encoding='utf-8') as f:
        return json.load(f)

def save_arb(data, filepath):
    """Save ARB file"""
    with open(filepath, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=2)
        f.write('\n')

def translate_value(value, dest_lang):
    """Translate a single value"""
    if not isinstance(value, str):
        return value

    # Skip placeholders like {count}, {error}
    if re.match(r'^{.+}$', value.strip()):
        return value

    # Skip if contains variable placeholders
    if '{' in value and '}' in value:
        # Try to translate the parts without placeholders
        parts = re.split(r'(\{[^}]+\})', value)
        translated_parts = []
        for part in parts:
            if re.match(r'\{.+\}$', part):
                translated_parts.append(part)
            elif part.strip():
                translated_parts.append(translate(part, dest_lang))
            else:
                translated_parts.append(part)
        return ''.join(translated_parts)

    return translate(value, dest_lang)

def translate_arb(source_data, dest_lang_code):
    """Translate entire ARB file"""
    translated = {"@@locale": dest_lang_code}

    for key, value in source_data.items():
        if key.startswith('@'):
            # Copy metadata unchanged
            translated[key] = value
        else:
            if isinstance(value, str):
                translated[key] = translate_value(value, dest_lang_code)
            elif isinstance(value, list):
                translated[key] = [translate_value(v, dest_lang_code) if isinstance(v, str) else v for v in value]
            else:
                translated[key] = value

    return translated

def main():
    if len(sys.argv) < 2:
        print("Usage: translate_arb.py <arb_file> [locale1 locale2 ...]")
        print(f"Available locales: {', '.join(LOCALES)}")
        sys.exit(1)

    arb_file = sys.argv[1]
    locales_to_translate = sys.argv[2:] if len(sys.argv) > 2 else LOCALES

    print(f"Loading source ARB: {arb_file}")
    source_data = load_arb(arb_file)

    source_lang = source_data.get('@@locale', 'en')
    print(f"Source language: {source_lang}")

    output_dir = Path(arb_file).parent

    for locale in locales_to_translate:
        if locale not in LANG_MAP:
            print(f"Skipping unknown locale: {locale}")
            continue

        dest_lang_code = LANG_MAP[locale]
        output_file = output_dir / f"app_{locale}.arb"

        print(f"Translating to {locale} ({dest_lang_code})...")

        try:
            translated_data = translate_arb(source_data, locale)
            save_arb(translated_data, output_file)
            print(f"  -> Created: {output_file}")
        except Exception as e:
            print(f"  -> Error: {e}")

        # Rate limiting
        time.sleep(0.5)

    print("Done!")

if __name__ == '__main__':
    main()
