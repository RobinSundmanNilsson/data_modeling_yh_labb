# 📊 Data Modeling YH Labb – YrkesCo

Ett projekt som demonstrerar datamodellering och implementation av ett datadrivet utbildningssystem för det fiktiva utbildningsföretaget **YrkesCo**.

## 🧠 Syfte

Projektets syfte är att:

- Bygga en komplett databasmodell (konceptuell, logisk och fysisk nivå)
- Implementera modellen i PostgreSQL med realistisk data
- Köra affärsnära SQL-queries för att möjliggöra analys, planering och administration
- Skapa en grund för framtida API:er, dashboards och användargränssnitt

## 📁 Innehåll

| Fil/Folder                  | Beskrivning |
|----------------------------|-------------|
| `sql_scripts/postgres_init/01_create_tables.sql`     | Skapar alla tabeller enligt fysisk modell |
| `sql_scripts/postgres_init/02_insert_data.sql`       | Fyller databasen med fiktiv men realistisk testdata |
| `sql_scripts/03_test_queries.sql`      | Innehåller flera SQL-queries för analys, rapportering och demo |
| `docker-compose.yml`       | Sätter upp en PostgreSQL-databas med initialisering |
| `data_model/data_modeling_yh_labb_*.png` | Bilder av den konceptuella, logiska och fysiska modellen |
| `data_modeling_yh_labb_presentation.pdf` | Presentation av projekt |
| `.env`                     | Miljövariabler för Docker (används automatiskt vid uppstart) |
| `README.md`                | Dokumentationen du läser nu |

## 🐳 Teknisk uppsättning

Databasen körs i en Docker-container.

### 1. Förutsättningar
- [Docker](https://www.docker.com/)
- .env-fil med nödvändiga miljövariabler för PostgreSQL.
Skapa en .env-fil i projektets rotkatalog med följande innehåll:

```env
POSTGRES_USER=<your_postgres_user>
POSTGRES_PASSWORD=<your_postgres_password>
POSTGRES_DB=<your_postgres_database>
```
Definera ditt egna användarnamn, lösenord och databasnamn.

### 2. Starta projektet

```bash
docker compose up -d
```
Alla SQL-skript i `sql_scripts/postgres_init` kommer att köras automatiskt vid uppstart av docker containern.

Databasen kommer att:
- Skapas automatiskt
- Fylla sig själv med tabeller och testdata

### 3. Logga in i databasen

```bash
docker exec -it postgres_labb_yrkesco psql -U <your_postgres_user> -d <your_postgres_database>
```

### 4. Använd rätt schema

```sql
SET search_path TO yrkesco;
```

## 🧪 Exempelqueries

Exempel på frågor som kan köras från `03_test_queries.sql`:

- Vilka kurser tillhör ett visst program?
- Vilka utbildningsledare är ansvariga för en klass?
- Hur många studenter går i varje klass?
- Vilka kurser undervisas av konsulter?
- Vilken roll har varje anställd (via COALESCE)?
- Hur många undervisningstimmar har varje instruktör?

## 📈 Affärsvärde

Denna databasmodell gör att YrkesCo kan:
- Planera sina program och klasser effektivt
- Hantera personal och studenter
- Utföra analyser av resurser och kapacitet
- Förbereda datan för framtida BI-lösningar och integrationer

---

## 🧑‍💻 Utvecklat av

**Robin Sundman Nilsson**  
Student på programmet Data Engineering, Stockholms Tekniska Institut