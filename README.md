### Kundenanalyse-ABAP-Project

Dieses Repository enthält ein Leichtgewichtiges ABAP-Projekt für Analytics auf Basis eigener Tabellen und CDS-Views.

Funktionen:

- Geografische Analyse von Bestellungen nach Ländern

- Detaillierte Ansicht der Bestellpositionen

- Kunden-Ranking nach Umsatz (Top-5)

- Befüllung von Demo-Daten per ADT-Konsole (Klasse)

- Abfrage von Kunden-Bestellungen und Top-Produkten über Konsole/ADT

---

### REPOSITORY-STRUKTUR

/ Core Data Services
├── Data Definitions
│   ├── zcust_geo_analysis.ddlsource
│   ├── zcust_orderitem_v.ddlsource
│   └── zcust_top5_cust.ddlsource

/ Dictionary
├── Database Tables
│   ├── zcust_customer.ddlsource
│   ├── zcust_order.ddlsource
│   ├── zcust_order_item.ddlsource
│   └── zcust_product.ddlsource
└── Views
    ├── zcust_geoanalys.ddlsource
    ├── zcust_orderitem.ddlsource
    └── zcust_top5cust.ddlsource

/ Source Code Library
└── Classes
    ├── zcl_0400_insertclient.abap
    ├── zcl_customer_orders.abap
    ├── zcl_top_products.abap
    └── zcx_static_check.abap

/ Texts
└── Message Classes
    └── zcl_message_nf

        


### Voraussetzungen
- ADT in Eclipse

### Weiterentwicklung
- Datumsfilter (Monat/Jahr) in CDS-Views hinzufügen
- Unit-Test
- Fiori-UI auf Basis der CDS-Views entwickeln
- Autorisierungsprüfungen ergänzen 
      
