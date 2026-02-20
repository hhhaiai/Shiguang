#!/usr/bin/env python3
"""
Generate arb files for all locales from English template.
"""

import json
import sys
from pathlib import Path

# All locales to generate
LOCALES = [
    # Europe
    'es', 'fr', 'de', 'it', 'pt-PT', 'pt-BR', 'nl', 'ru', 'pl', 'uk',
    'ro', 'cs', 'sk', 'hu', 'sv', 'nb', 'da', 'fi', 'el', 'bg',
    'sr', 'hr', 'sl', 'lt', 'lv', 'et', 'ga', 'cy', 'is', 'ca',
    'eu', 'gl', 'sq', 'mt', 'mk', 'bs',
    # East Asia
    'zh-Hans', 'zh-Hant', 'zh-TW', 'zh-HK', 'ja', 'ko', 'mn',
    # Southeast Asia
    'vi', 'th', 'id', 'ms', 'fil', 'my', 'km', 'lo',
    # South Asia
    'hi', 'bn', 'ur', 'ta', 'te', 'mr', 'gu', 'kn', 'ml', 'pa', 'ne', 'si',
    # Middle East
    'ar', 'he', 'fa', 'tr', 'az', 'hy', 'ka',
    # Africa
    'sw', 'zu', 'xh', 'yo', 'ig', 'ha', 'am', 'so', 'af',
    # Americas
    'ht', 'qu',
]

# Locale to language name mapping
LOCALE_NAMES = {
    # Europe
    'es': 'Spanish',
    'fr': 'French',
    'de': 'German',
    'it': 'Italian',
    'pt-PT': 'Portuguese (Portugal)',
    'pt-BR': 'Portuguese (Brazil)',
    'nl': 'Dutch',
    'ru': 'Russian',
    'pl': 'Polish',
    'uk': 'Ukrainian',
    'ro': 'Romanian',
    'cs': 'Czech',
    'sk': 'Slovak',
    'hu': 'Hungarian',
    'sv': 'Swedish',
    'nb': 'Norwegian Bokmål',
    'da': 'Danish',
    'fi': 'Finnish',
    'el': 'Greek',
    'bg': 'Bulgarian',
    'sr': 'Serbian',
    'hr': 'Croatian',
    'sl': 'Slovenian',
    'lt': 'Lithuanian',
    'lv': 'Latvian',
    'et': 'Estonian',
    'ga': 'Irish',
    'cy': 'Welsh',
    'is': 'Icelandic',
    'ca': 'Catalan',
    'eu': 'Basque',
    'gl': 'Galician',
    'sq': 'Albanian',
    'mt': 'Maltese',
    'mk': 'Macedonian',
    'bs': 'Bosnian',
    # East Asia
    'zh-Hans': 'Chinese Simplified',
    'zh-Hant': 'Chinese Traditional',
    'zh-TW': 'Chinese (Taiwan)',
    'zh-HK': 'Chinese (Hong Kong)',
    'ja': 'Japanese',
    'ko': 'Korean',
    'mn': 'Mongolian',
    # Southeast Asia
    'vi': 'Vietnamese',
    'th': 'Thai',
    'id': 'Indonesian',
    'ms': 'Malay',
    'fil': 'Filipino',
    'my': 'Burmese',
    'km': 'Khmer',
    'lo': 'Lao',
    # South Asia
    'hi': 'Hindi',
    'bn': 'Bengali',
    'ur': 'Urdu',
    'ta': 'Tamil',
    'te': 'Telugu',
    'mr': 'Marathi',
    'gu': 'Gujarati',
    'kn': 'Kannada',
    'ml': 'Malayalam',
    'pa': 'Punjabi',
    'ne': 'Nepali',
    'si': 'Sinhala',
    # Middle East
    'ar': 'Arabic',
    'he': 'Hebrew',
    'fa': 'Persian',
    'tr': 'Turkish',
    'az': 'Azerbaijani',
    'hy': 'Armenian',
    'ka': 'Georgian',
    # Africa
    'sw': 'Swahili',
    'zu': 'Zulu',
    'xh': 'Xhosa',
    'yo': 'Yoruba',
    'ig': 'Igbo',
    'ha': 'Hausa',
    'am': 'Amharic',
    'so': 'Somali',
    'af': 'Afrikaans',
    # Americas
    'ht': 'Haitian Creole',
    'qu': 'Quechua',
}

def load_arb(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        return json.load(f)

def save_arb(data, filepath):
    with open(filepath, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=2)
        f.write('\n')

def create_arb_from_template(source_data, locale):
    """Create ARB file with locale set"""
    arb = {"@@locale": locale}
    for key, value in source_data.items():
        if key.startswith('@'):
            arb[key] = value
        else:
            arb[key] = value  # Keep English as placeholder
    return arb

def main():
    if len(sys.argv) < 2:
        print("Usage: generate_arb.py <source_arb_file>")
        sys.exit(1)

    source_file = sys.argv[1]
    print(f"Loading source: {source_file}")

    source_data = load_arb(source_file)
    output_dir = Path(source_file).parent

    created = []
    for locale in LOCALES:
        output_file = output_dir / f"app_{locale}.arb"
        arb_data = create_arb_from_template(source_data, locale)
        save_arb(arb_data, output_file)
        created.append(f"app_{locale}.arb")

    print(f"\nCreated {len(created)} arb files:")
    for f in created:
        print(f"  - {f}")

    # Update l10n.yaml with all locales
    l10n_file = output_dir.parent / 'l10n.yaml'
    if l10n_file.exists():
        with open(l10n_file, 'r') as f:
            l10n_content = f.read()

        # Add synthetic-package: false to prevent issues
        if 'synthetic-package' not in l10n_content:
            l10n_content += '\n# synthetic-package: false\n'

        with open(l10n_file, 'w') as f:
            f.write(l10n_content)

        print(f"\nUpdated {l10n_file}")

    print("\nDone! Now use AI to translate the values.")

if __name__ == '__main__':
    main()
