# Werkplaats projectmanagement

Een statische site, opgezet en bijgehouden op persoonlijke titel, ter
ondersteuning van werkzaamheden op het gebied van projectmanagement. De site is
geen officiële uiting van ODI of de Rijksoverheid.

Live: https://ambtenaar-hendriks.github.io/ODI/

| Pagina | Wat het is |
| --- | --- |
| `/` | Introductie van de site. |
| `/complexiteitsscore/` | **Complexiteitsscore**: schat de complexiteit van een project of programma in op tien dimensies, gebaseerd op de IPMA-classificatie. Opslaan gebeurt alleen in de browser; exporteren kan als CSV, Markdown en PDF. |
| `/over/` en `/toegankelijkheid/` | Over deze site en de toegankelijkheidsverklaring. |

## Aan de slag

Nodig: [Hugo](https://gohugo.io/) **0.164.0 extended** (dezelfde versie als in
CI) en eventueel [just](https://github.com/casey/just).

```sh
cd sites/odi
hugo server --baseURL http://localhost:1313/ --appendPort=false   # -> http://localhost:1313
```

Met just: `just up` (ontwikkelserver) en `just build` (bouw naar `public/`).

## Structuur

| Pad | Inhoud |
| --- | --- |
| `sites/odi/content/` | Teksten van de pagina's (markdown) |
| `sites/odi/layouts/_partials/complexiteitstabel.html` | De Complexiteitsscore zelf: CSS, HTML en JavaScript in één bestand |
| `sites/odi/layouts/_partials/complexiteitsversie.html` | Versie-aanduiding en "Wat is er nieuw?" |
| `sites/odi/data/complexiteitsscore_versies.yaml` | Versiegeschiedenis van de Complexiteitsscore, nieuwste bovenaan |
| `sites/odi/hugo.yaml` | Instellingen, menu en statusbalk |
| `gedeeld/layouts/` | Header, footer, head en basissjabloon |
| `gedeeld/assets/css/eigen.css` | Eigen CSS, alleen de ruimte tússen componenten |
| `gedeeld/static/vendor/nldd/` | Het [NLDD design system](https://minbzk.github.io/storybook/), gevendord (zie `VERSION.txt`) |

Een bestand in `sites/odi/` gaat vóór op de gedeelde laag: zet een `layouts/`
met dezelfde naam daar neer om iets te overschrijven.

## Werkwijze

1. Maak een branch en wijzig lokaal; bekijk het met `hugo server`.
2. Werk bij een wijziging van de Complexiteitsscore
   `data/complexiteitsscore_versies.yaml` bij: één versie per datum, nieuwste
   bovenaan.
3. Push de branch en open een pull request. De controle **Valideer en bouw**
   bouwt de site; na het groene vinkje samenvoegen.
4. Elke push naar `main` publiceert automatisch naar GitHub Pages
   (`.github/workflows/deploy.yml`).

## Herkomst

De opzet is begonnen als kopie van een proof of concept voor een ODI-startpagina
en is daarna teruggebracht tot deze persoonlijke werkplaats. De vormgeving komt
uit het NLDD design system; componentpatronen zijn overgenomen uit
[Wies](https://github.com/RijksICTGilde/wies) en de paginaopbouw volgt
[moza-site](https://github.com/MinBZK/moza-site).

## Licentie

Zie [LICENSE](LICENSE), overgenomen uit moza-site (EUPL 1.2).
