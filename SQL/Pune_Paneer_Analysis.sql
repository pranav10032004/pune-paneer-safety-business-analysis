-- Pune Paneer Safety & Supply-Chain Risk Analysis
-- Independent Business Analyst portfolio case study
-- Research cut-off: 2026-09-26
-- IMPORTANT: This is a public-evidence dataset, not a representative market sample.
-- Do not convert enforcement seizure volume into a market-wide prevalence/risk rate.

DROP TABLE IF EXISTS paneer_cases;
DROP TABLE IF EXISTS research_sources;
DROP TABLE IF EXISTS regulatory_benchmarks;

CREATE TABLE paneer_cases (
    case_id TEXT PRIMARY KEY,
    event_date DATE NOT NULL,
    year INT NOT NULL,
    location TEXT,
    establishment_context TEXT,
    operation_type TEXT,
    paneer_quantity_kg NUMERIC,
    paneer_value_inr NUMERIC,
    total_goods_qty_kg NUMERIC,
    reported_status TEXT,
    lab_status TEXT,
    issue_flags TEXT,
    supply_chain_clue TEXT,
    source_id TEXT,
    source_url TEXT,
    notes TEXT
);

INSERT INTO paneer_cases (case_id,event_date,year,location,establishment_context,operation_type,paneer_quantity_kg,paneer_value_inr,total_goods_qty_kg,reported_status,lab_status,issue_flags,supply_chain_clue,source_id,source_url,notes) VALUES
('PUN_2023_01','2023-05-11',2023,'Chinchwad, Pune','Dairy manufacturing unit','Manufacturing',109,466000,NULL,'Suspected spurious/adulterated paneer seized','Samples sent for testing; result not stated in cited article','Suspected adulteration; illegal manufacturing','Local manufacturing unit; milk powder + palmolein oil + acetic acid + GMS reported','SRC_03','https://indianexpress.com/article/cities/pune/dairy-unit-adulterated-paneer-chinchwad-goods-worth-8603405/','Article reports 109 kg paneer and associated industrial ingredients seized.'),
('PUN_2025_01','2025-03-08',2025,'Manjri Khurd / Wagholi, Pune','Illegal paneer manufacturing unit','Manufacturing + distribution',1400,1156690,NULL,'Authorities seized 1,400 kg reported adulterated paneer','Source reports ingredients and action; no public lab report cited','Adulteration; unhygienic production; repeat operator','Reported for local-market supply; GMS, SMP and palm oil seized','SRC_04','https://www.hindustantimes.com/cities/pune-news/pune-police-seize-1-400-kg-contaminated-paneer-worth-11-lakh-101741374185066.html','Use caution: this is an enforcement report, not a prevalence estimate.'),
('PUN_2026_06','2026-06-07',2026,'Somwar Peth; Budhwar Peth; Shukrawar Peth; Kothrud; Hadapsar','Dairy-product selling/holding establishments','Storage / distribution / sale',2806,755605,17031,'Suspected adulterated/non-compliant stock seized in simultaneous raids at 17 locations','35 mixed dairy-product samples collected and sent to laboratory','Suspected adulteration; missing labels/invoices; unhygienic storage','Purchase invoices absent for some stock; establishment source details not complete in public report','SRC_05','https://timesofindia.indiatimes.com/city/pune/suspicious-khoya-paneer-and-ghee-worth-47-lakh-seized-in-pune/articleshow/131558578.cms','The 35 samples cover paneer, khoya, cheese analogue and ghee; they are not all paneer samples.'),
('PUN_2026_09','2026-09-11',2026,'Pune (supplier raid; exact premises not needed for portfolio)','Large supplier / distributor','Distribution',10000,NULL,15000,'Around 10,000 kg suspected adulterated paneer seized','Samples being collected at the spot for testing; result not reported in cited article','Suspected adulteration; large-scale distribution','Stock suspected by officials to have originated from Karnataka and to be distributed across Maharashtra','SRC_06','https://www.indiatoday.in/cities/pune/story/pune-fda-raid-seizes-suspected-fake-paneer-and-khoya-amid-maharashtra-ban-2992231-2026-09-11','Use the word ''suspected'' because the article says testing was underway.');

CREATE TABLE research_sources (
    source_id TEXT PRIMARY KEY,
    publication_date TEXT,
    publisher TEXT,
    title TEXT,
    source_type TEXT,
    url TEXT,
    reliability TEXT,
    use_note TEXT
);

INSERT INTO research_sources (source_id,publication_date,publisher,title,source_type,url,reliability,use_note) VALUES
('SRC_01','2026-09-24','FSSAI','Draft Food Safety and Standards (Prohibition and Restrictions on Sales) Amendment Regulations, 2026 relating to restriction of paneer made of constituents not derived from milk','Official regulatory notice','https://fssai.gov.in/food-law/notifications','High','Current national regulatory direction; draft status.'),
('SRC_02','2017-10-24','FSSAI','Gazette Notification - Standard for Chhana and Paneer','Official standard','https://www.fssai.gov.in/upload/uploadfiles/files/Gazette_Notification_Milk_Products_24_10_2017.pdf','High','Definition and composition benchmark for paneer.'),
('SRC_03','2023-05-11','The Indian Express','Dairy unit making adulterated paneer busted in Chinchwad','Pune enforcement report','https://indianexpress.com/article/cities/pune/dairy-unit-adulterated-paneer-chinchwad-goods-worth-8603405/','Medium-High','Historical Pune enforcement case.'),
('SRC_04','2025-03-08','Hindustan Times','Pune police seize 1,400 kg contaminated paneer worth Rs 11 lakh','Pune enforcement report','https://www.hindustantimes.com/cities/pune-news/pune-police-seize-1-400-kg-contaminated-paneer-worth-11-lakh-101741374185066.html','Medium-High','2025 Pune manufacturing/distribution case.'),
('SRC_05','2026-06-07','Times of India','Suspicious khoya, paneer and ghee worth Rs 47 lakh seized in Pune','Pune enforcement report','https://timesofindia.indiatimes.com/city/pune/suspicious-khoya-paneer-and-ghee-worth-47-lakh-seized-in-pune/articleshow/131558578.cms','Medium-High','17-location raid; paneer seizure and 35 mixed samples.'),
('SRC_06','2026-09-11','India Today','10,000 kg adulterated paneer, 5,000 kg fake khoya seized in massive Pune crackdown','Pune enforcement report','https://www.indiatoday.in/cities/pune/story/pune-fda-raid-seizes-suspected-fake-paneer-and-khoya-amid-maharashtra-ban-2992231-2026-09-11','Medium-High','Current Pune supplier/distribution case; testing was underway.'),
('SRC_07','2026-07-30','Maharashtra FDA','Prohibition of Analogue / Non-Dairy Paneer','Official state order listing','https://fda.maharashtra.gov.in/related-acts-circulars/','High','Official listing of the one-year statewide prohibition.'),
('SRC_08','2026-09-23','FSSAI','Food Safety Connect','Official consumer service','https://www.fssai.gov.in/food-safety-connect','High','Complaint and FBO licence/registration verification pathway.'),
('SRC_09','2026-04-01 to 2026-03-31','Maharashtra FDA / reported in Indian Express and Hindustan Times','Statewide surveillance result: 109 of 308 analysed paneer/dairy-analogue samples non-conforming','Official result reported by press','https://indianexpress.com/article/cities/mumbai/no-more-non-dairy-analog-paneer-on-your-plate-as-maharashtra-enforces-ban-for-a-year-failed-fda-test-10818916/lite/','Medium-High','Benchmark only; statewide, not Pune-specific.'),
('SRC_10','2025-03-11','FSSAI','Ensuring Safe Festivities: FSSAI Directs States to Step Up Food Safety Checks on Dairy Analogues','Official press release','https://www.fssai.gov.in/upload/uploadfiles/files/pressRelease_surveillance_drive.pdf','High','Context on dairy-analogue surveillance and misrepresentation.'),
('SRC_11','2025-04','FSSAI','Consultation Paper - Provisions of ''Analogue in Dairy Context''','Official consultation paper','https://www.fssai.gov.in/upload/advisories/2025/04/67ffa639c8c29Consultation%20Paper%20for%20inviting%20comments.pdf','High','Proposed menu disclosure / labelling and controls for HoReCa.');

CREATE TABLE regulatory_benchmarks (
    benchmark_id TEXT PRIMARY KEY,
    metric TEXT,
    value NUMERIC,
    unit TEXT,
    period TEXT,
    geography TEXT,
    status TEXT,
    source_id TEXT,
    source_url TEXT
);

INSERT INTO regulatory_benchmarks (benchmark_id,metric,value,unit,period,geography,status,source_id,source_url) VALUES
('RB_01','Maharashtra analysed samples',308,'samples','2025-04-01 to 2026-03-31','Maharashtra','Official sampling result reported','SRC_09','https://indianexpress.com/article/cities/mumbai/no-more-non-dairy-analog-paneer-on-your-plate-as-maharashtra-enforces-ban-for-a-year-failed-fda-test-10818916/lite/'),
('RB_02','Maharashtra non-conforming samples',109,'samples','2025-04-01 to 2026-03-31','Maharashtra','Official sampling result reported','SRC_09','https://indianexpress.com/article/cities/mumbai/no-more-non-dairy-analog-paneer-on-your-plate-as-maharashtra-enforces-ban-for-a-year-failed-fda-test-10818916/lite/'),
('RB_03','Maharashtra non-conforming rate',35.4,'percent','2025-04-01 to 2026-03-31','Maharashtra','Derived from 109/308','SRC_09','https://indianexpress.com/article/cities/mumbai/no-more-non-dairy-analog-paneer-on-your-plate-as-maharashtra-enforces-ban-for-a-year-failed-fda-test-10818916/lite/'),
('RB_04','Sub-standard among failed samples',79,'samples','2025-04-01 to 2026-03-31','Maharashtra','Official sampling result reported','SRC_09','https://indianexpress.com/article/cities/mumbai/no-more-non-dairy-analog-paneer-on-your-plate-as-maharashtra-enforces-ban-for-a-year-failed-fda-test-10818916/lite/'),
('RB_05','Unsafe among failed samples',30,'samples','2025-04-01 to 2026-03-31','Maharashtra','Official sampling result reported','SRC_09','https://indianexpress.com/article/cities/mumbai/no-more-non-dairy-analog-paneer-on-your-plate-as-maharashtra-enforces-ban-for-a-year-failed-fda-test-10818916/lite/'),
('RB_06','Pune June 2026 raid locations',17,'establishments','2026-06-07','Pune','Reported enforcement action','SRC_05','https://timesofindia.indiatimes.com/city/pune/suspicious-khoya-paneer-and-ghee-worth-47-lakh-seized-in-pune/articleshow/131558578.cms'),
('RB_07','Pune June 2026 mixed food samples',35,'samples','2026-06-07','Pune','Sent for laboratory analysis','SRC_05','https://timesofindia.indiatimes.com/city/pune/suspicious-khoya-paneer-and-ghee-worth-47-lakh-seized-in-pune/articleshow/131558578.cms');

-- Query 1: total paneer quantity reported/seized across cited Pune events
SELECT SUM(paneer_quantity_kg) AS total_paneer_kg
FROM paneer_cases;

-- Query 2: reported events and paneer quantity by year
SELECT year, COUNT(*) AS reported_events, SUM(paneer_quantity_kg) AS paneer_kg
FROM paneer_cases
GROUP BY year
ORDER BY year;

-- Query 3: events by operational context
SELECT establishment_context, COUNT(*) AS events, SUM(paneer_quantity_kg) AS paneer_kg
FROM paneer_cases
GROUP BY establishment_context
ORDER BY paneer_kg DESC;

-- Query 4: largest reported seizure events
SELECT event_date, location, paneer_quantity_kg, reported_status, supply_chain_clue
FROM paneer_cases
ORDER BY paneer_quantity_kg DESC NULLS LAST;

-- Query 5: cases where documentation / traceability concerns are explicitly mentioned
SELECT case_id, event_date, location, issue_flags, supply_chain_clue
FROM paneer_cases
WHERE issue_flags ILIKE '%invoice%'
   OR supply_chain_clue ILIKE '%invoice%'
   OR issue_flags ILIKE '%label%';

-- Query 6: 2026 cases where public reporting still describes suspicion/testing status
SELECT case_id, event_date, location, reported_status, lab_status
FROM paneer_cases
WHERE year = 2026
  AND (
      reported_status ILIKE '%suspected%'
      OR lab_status ILIKE '%testing%'
      OR lab_status ILIKE '%collected%'
  );

-- Query 7: statewide benchmark - not Pune-specific
SELECT metric, value, unit, geography, period
FROM regulatory_benchmarks
WHERE benchmark_id IN ('RB_01','RB_02','RB_03','RB_04','RB_05');

-- Interview note:
-- The 35.4% benchmark is 109/308 for Maharashtra statewide sampling.
-- It is NOT a Pune restaurant risk percentage.
