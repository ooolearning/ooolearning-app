package main

import (
	"encoding/xml"
	"fmt"
)

// JM.

type JMDict struct {
	XMLName xml.Name  `xml:"JMdict"`
	Entries []JMEntry `xml:"entry"`
}

type JMEntry struct {
	EntSeq int       `xml:"ent_seq"`
	KEle   []JMKEle  `xml:"k_ele"`
	REle   []JMREle  `xml:"r_ele"`
	Sense  []JMSense `xml:"sense"`
}

type JMKEle struct {
	Keb   string   `xml:"keb"`
	KePri []string `xml:"ke_pri"`
}

type JMREle struct {
	Reb       string    `xml:"reb"`
	ReNokanji *struct{} `xml:"re_nokanji,omitempty"`
	RePri     []string  `xml:"re_pri"`
}

type JMSense struct {
	Pos     string      `xml:"pos"`
	Xref    string      `xml:"xref,omitempty"`
	Misc    []string    `xml:"misc"`
	Gloss   []JMGloss   `xml:"gloss"`
	Example []JMExample `xml:"example"`
	Ant     string      `xml:"ant,omitempty"`
}

type JMExample struct {
	ExSrce JMExSrce   `xml:"ex_srce"`
	ExText string     `xml:"ex_text"`
	ExSent []JMExSent `xml:"ex_sent"`
}

type JMExSrce struct {
	ExSrcType string `xml:"exsrc_type,attr"`
	Value     string `xml:",chardata"`
}

type JMExSent struct {
	Lang  string `xml:"lang,attr"`
	Value string `xml:",chardata"`
}

type JMGloss struct {
	GType string `xml:"g_type,attr,omitempty"`
	Value string `xml:",chardata"`
}

// Word frequency.

type TableRow struct {
	Rank        string
	Occurrences string
	Lemma       string
	Extra       string
}

// App.

type AppEntry struct {
	Frequency       int64
	Id              string
	ReadingElements []AppReadingElement
	Senses          []AppSense
}

func (e *AppEntry) String() string {
	mainGlossary := ""
	mainType := ""
	mainValue := ""

	for _, v := range e.ReadingElements {
		mainType = v.Type
		mainValue = v.Value
	}

outer:
	for _, v := range e.Senses {
		for _, v := range v.Glossaries {
			mainGlossary = v
			break outer
		}
	}

	return fmt.Sprintf("%s [%s] - %s", mainType, mainValue, mainGlossary)
}

type AppReadingElement struct {
	Priorities []string // news1/2, ichi1/2, spec1/2, gai1/2, nfxx
	Type       string   // kanji, reading
	Value      string
}

type AppSense struct {
	Glossaries   []string
	PartOfSpeech string
}
