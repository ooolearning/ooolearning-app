package main

import (
	"bytes"
	"encoding/xml"
	"fmt"
	"io"
	"log"
	"net/http"
	"os"
	"strings"

	"github.com/PuerkitoBio/goquery"
)

var (
	posMap = map[string]string{
		"adj-f":     "noun or verb acting prenominally",
		"adj-i":     "adjective (keiyoushi)",
		"adj-ix":    "adjective (keiyoushi) - yoi/ii class",
		"adj-kari":  "'kari' adjective (archaic)",
		"adj-ku":    "'ku' adjective (archaic)",
		"adj-na":    "adjectival nouns or quasi-adjectives (keiyodoshi)",
		"adj-nari":  "archaic/formal form of na-adjective",
		"adj-no":    "nouns which may take the genitive case particle 'no'",
		"adj-pn":    "pre-noun adjectival (rentaishi)",
		"adj-shiku": "'shiku' adjective (archaic)",
		"adj-t":     "'taru' adjective",
		"adv":       "adverb (fukushi)",
		"adv-to":    "adverb taking the 'to' particle",
		"aux":       "auxiliary",
		"aux-adj":   "auxiliary adjective",
		"aux-v":     "auxiliary verb",
		"conj":      "conjunction",
		"cop":       "copula",
		"ctr":       "counter",
		"exp":       "expressions (phrases, clauses, etc.)",
		"int":       "interjection (kandoushi)",
		"n":         "noun (common) (futsuumeishi)",
		"n-adv":     "adverbial noun (fukushitekimeishi)",
		"n-pr":      "proper noun",
		"n-pref":    "noun, used as a prefix",
		"n-suf":     "noun, used as a suffix",
		"n-t":       "noun (temporal) (jisoumeishi)",
		"num":       "numeric",
		"pn":        "pronoun",
		"pref":      "prefix",
		"prt":       "particle",
		"suf":       "suffix",
		"unc":       "unclassified",
		"v-unspec":  "verb unspecified",
		"v1":        "Ichidan verb",
		"v1-s":      "Ichidan verb - kureru special class",
		"v2a-s":     "Nidan verb with 'u' ending (archaic)",
		"v2b-k":     "Nidan verb (upper class) with 'bu' ending (archaic)",
		"v2b-s":     "Nidan verb (lower class) with 'bu' ending (archaic)",
		"v2d-k":     "Nidan verb (upper class) with 'dzu' ending (archaic)",
		"v2d-s":     "Nidan verb (lower class) with 'dzu' ending (archaic)",
		"v2g-k":     "Nidan verb (upper class) with 'gu' ending (archaic)",
		"v2g-s":     "Nidan verb (lower class) with 'gu' ending (archaic)",
		"v2h-k":     "Nidan verb (upper class) with 'hu/fu' ending (archaic)",
		"v2h-s":     "Nidan verb (lower class) with 'hu/fu' ending (archaic)",
		"v2k-k":     "Nidan verb (upper class) with 'ku' ending (archaic)",
		"v2k-s":     "Nidan verb (lower class) with 'ku' ending (archaic)",
		"v2m-k":     "Nidan verb (upper class) with 'mu' ending (archaic)",
		"v2m-s":     "Nidan verb (lower class) with 'mu' ending (archaic)",
		"v2n-s":     "Nidan verb (lower class) with 'nu' ending (archaic)",
		"v2r-k":     "Nidan verb (upper class) with 'ru' ending (archaic)",
		"v2r-s":     "Nidan verb (lower class) with 'ru' ending (archaic)",
		"v2s-s":     "Nidan verb (lower class) with 'su' ending (archaic)",
		"v2t-k":     "Nidan verb (upper class) with 'tsu' ending (archaic)",
		"v2t-s":     "Nidan verb (lower class) with 'tsu' ending (archaic)",
		"v2w-s":     "Nidan verb (lower class) with 'u' ending and 'we' conjugation (archaic)",
		"v2y-k":     "Nidan verb (upper class) with 'yu' ending (archaic)",
		"v2y-s":     "Nidan verb (lower class) with 'yu' ending (archaic)",
		"v2z-s":     "Nidan verb (lower class) with 'zu' ending (archaic)",
		"v4b":       "Yodan verb with 'bu' ending (archaic)",
		"v4g":       "Yodan verb with 'gu' ending (archaic)",
		"v4h":       "Yodan verb with 'hu/fu' ending (archaic)",
		"v4k":       "Yodan verb with 'ku' ending (archaic)",
		"v4m":       "Yodan verb with 'mu' ending (archaic)",
		"v4n":       "Yodan verb with 'nu' ending (archaic)",
		"v4r":       "Yodan verb with 'ru' ending (archaic)",
		"v4s":       "Yodan verb with 'su' ending (archaic)",
		"v4t":       "Yodan verb with 'tsu' ending (archaic)",
		"v5aru":     "Godan verb - -aru special class",
		"v5b":       "Godan verb with 'bu' ending",
		"v5g":       "Godan verb with 'gu' ending",
		"v5k":       "Godan verb with 'ku' ending",
		"v5k-s":     "Godan verb - Iku/Yuku special class",
		"v5m":       "Godan verb with 'mu' ending",
		"v5n":       "Godan verb with 'nu' ending",
		"v5r":       "Godan verb with 'ru' ending",
		"v5r-i":     "Godan verb with 'ru' ending (irregular verb)",
		"v5s":       "Godan verb with 'su' ending",
		"v5t":       "Godan verb with 'tsu' ending",
		"v5u":       "Godan verb with 'u' ending",
		"v5u-s":     "Godan verb with 'u' ending (special class)",
		"v5uru":     "Godan verb - Uru old class verb (old form of Eru)",
		"vi":        "intransitive verb",
		"vk":        "Kuru verb - special class",
		"vn":        "irregular nu verb",
		"vr":        "irregular ru verb, plain form ends with -ri",
		"vs":        "noun or participle which takes the aux. verb suru",
		"vs-c":      "su verb - precursor to the modern suru",
		"vs-i":      "suru verb - included",
		"vs-s":      "suru verb - special class",
		"vt":        "transitive verb",
		"vz":        "Ichidan verb - zuru verb (alternative form of -jiru verbs)",
	}
)

func main() {
	jmDoc, err := parseJMContent()
	if err != nil {
		log.Fatal(err)
	}

	appEntries := []AppEntry{}
	for _, jmEntry := range jmDoc.Entries {
		readingElements := []AppReadingElement{}

		for _, jmKEle := range jmEntry.KEle {
			readingElements = append(readingElements, AppReadingElement{
				Type:  "kanji",
				Value: jmKEle.Keb,
			})
		}

		for _, jmREle := range jmEntry.REle {
			readingElements = append(readingElements, AppReadingElement{
				Type:  "reading",
				Value: jmREle.Reb,
			})
		}

		senses := []AppSense{}
		for _, jmSense := range jmEntry.Sense {
			senses = append(senses, AppSense{
				PartOfSpeech: posMap[jmSense.Pos[1:len(jmSense.Pos)-1]],
			})
		}

		appEntries = append(appEntries, AppEntry{
			Id:              fmt.Sprintf("%d", jmEntry.EntSeq),
			ReadingElements: readingElements,
			Senses:          senses,
		})
	}

	print(len(appEntries))

	content, err := getPageContent()
	if err != nil {
		log.Fatal(err)
	}

	rows, err := parseTableRows(content)
	if err != nil {
		log.Fatal(err)
	}

	print(rows)
}

func getPageContent() (string, error) {
	target := "https://en.m.wiktionary.org/wiki/Wiktionary:Frequency_lists/Japanese2022_10000"

	resp, err := http.Get(target)
	if err != nil {
		return "", err
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return "", err
	}

	return string(body), nil
}

func parseJMContent() (*JMDict, error) {
	data, err := os.ReadFile("./resources/test.xml")
	if err != nil {
		return nil, err
	}

	doc := &JMDict{}

	xmlDecoder := xml.NewDecoder(bytes.NewReader(data))
	xmlDecoder.Strict = false
	err = xmlDecoder.Decode(doc)
	if err != nil {
		return nil, err
	}

	return doc, nil
}

func parseTableRows(htmlContent string) ([]TableRow, error) {
	doc, err := goquery.NewDocumentFromReader(strings.NewReader(htmlContent))
	if err != nil {
		return nil, err
	}

	rows := []TableRow{}

	doc.Find(".mf-section-0 table tr").Each(func(i int, td *goquery.Selection) {
		if i == 0 {
			return
		}

		row := TableRow{}

		td.Children().Each(func(j int, td *goquery.Selection) {
			content := strings.TrimSpace(td.Text())

			switch j {
			case 0:
				row.Rank = content
			case 1:
				row.Occurrences = content
			case 2:
				row.Lemma = content
			case 3:
				row.Extra = content
			}
		})

		rows = append(rows, row)
	})

	return rows, nil
}
