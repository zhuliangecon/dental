# Dental Insurance Project
 
# Background on the Dental Insurance Market in the United States

This document provides a detailed overview of the dental insurance market in the United States. It includes information on how dental practices are typically organized, as well as the structure of the dental insurance market.

## Dental Practice Organization in the US

Dentists in the United States work in a variety of settings:

1. **Private Practice**: The majority of dentists, approximately 80%, operate in a private practice environment. This includes solo practitioners as well as partnerships and small group practices. These dentists handle all aspects of running the practice, from patient care to business operations.

2. **Dental Service Organizations (DSOs)**: A growing segment of dentists work with DSOs, organizations that provide business support and management services to allow dentists to focus on patient care. Dentists working in a DSO do not handle the business operations of the practice.

3. **Hospitals and Community Clinics**: A smaller percentage of dentists work in hospitals or community clinics, which may offer a broad range of medical services including dental care.

## General Characteristics of the US Dental Insurance Market

1. **Separate Insurance Plans**: In the US, dental insurance is typically separate from medical insurance. This means that individuals often need to purchase separate plans to cover dental services.

2. **Employer-Provided Insurance**: Many Americans receive dental insurance through their employers. Many companies offer dental insurance as part of their employee benefits packages.

3. **Insurance Networks**: Many dental insurance plans operate on a network basis, where there is a network of dentists who provide services at discounted rates.

4. **Payment Structure**: Dental insurance typically involves monthly premiums, annual deductibles, and copayments or coinsurance for certain services.

5. **Coverage**: Dental insurance coverage typically includes preventive and basic services and some major services. However, the specifics can vary depending on the insurance plan.


## Some papers or materials on this market
-. [Nasse et al 2020](Documents/References/Nasseh%20et%20al._2020.pdf): An increase in commercial dental insurance market concentration leads to consolidation among dentists rather than owning their own practices. However, the impact of higher levels of dental insurance market concentration on a dentist's decision to affiliate with a dental management service organization is inconclusive.

-. [Kuttler 2017](https://www.groupdentistrynow.com/dso-group-blog/dso-case-study-reimbursement/): This is a testimonial from a client who is part of a Dental Management Service Organization (DMSO). They praise Apex for successfully negotiating with insurance companies to increase their reimbursement rates, which ranged from 8% to 26%. 

-. [The Benefits Created by Dental Service Organizations](Documents/References/DSOFinal.pdf)

-. [Practice Ownership Among Dentists Continues to Decline](https://www.ada.org/-/media/project/ada-organization/ada/ada-org/files/resources/research/hpi/hpigraphic_practice_ownership_among_dentists_decline.pdf)

-. [Contract Negotiations Guide by ADA](https://www.ada.org/resources/practice/dental-insurance/contract-negotiations-guide): rate is negotiable before contract. bilateral bargaining.

-. [Nasseh, Bowblis, Vujicic 2021](Documents/References/Nasseh,%20Bowblis,%20Vujicic_2021.pdf): assumes a bilateral Nash bargaining game

-. [The ins and outs of dental insurance](https://www.sciencedirect.com/science/article/abs/pii/S0002817714644111?via%3Dihub): NO subscription, $30 purchase.

-. [The reimbursement crisis is real. What are you doing about it?](https://www.dentaleconomics.com/macro-op-ed/article/16386229/the-reimbursement-crisis-is-real-what-are-you-doing-about-it): insurer has higher bargaining power

# Data Source
## NPI (National Provider Identifier) 

The National Provider Identifier (NPI) is a unique 10-digit identification number issued to health care providers in the United States by the Centers for Medicare and Medicaid Services (CMS). The NPI has replaced the unique physician identification number (UPIN) as the required identifier for Medicare services, and is used by other healthcare payers, including commercial healthcare insurance companies.

The NPI Registry, which is part of the official NPI database, contains information about the healthcare provider, such as the provider’s name, specialty (taxonomy), and practice address. Each healthcare provider, including individual dentists, has a unique NPI.

[NPI: What You Need to Know](https://www.cms.gov/outreach-and-education/medicare-learning-network-mln/mlnproducts/downloads/npi-what-you-need-to-know.pdf) An booklet teaches providers about the National Provider Identifier (NPI). 

[NPI Downlaod page](https://download.cms.gov/nppes/NPI_Files.html)

The NPI database can be very useful for research on the dental insurance market because it provides detailed information on individual dental providers. Specifically, the NPI database includes a taxonomy code that indicates the provider's specialty.

| Dentistry Specialty | Taxonomy Code |
|---|---|
| Dentist | 122300000X |
| &nbsp;&nbsp;&nbsp;&nbsp;Dental Public Health | 1223D0001X |
| &nbsp;&nbsp;&nbsp;&nbsp;Dentist Anesthesiologist | 1223D0004X |
| &nbsp;&nbsp;&nbsp;&nbsp;Endodontics | 1223E0200X |
| &nbsp;&nbsp;&nbsp;&nbsp;General Practice | 1223G0001X |
| &nbsp;&nbsp;&nbsp;&nbsp;Oral and Maxillofacial Pathology | 1223P0106X |
| &nbsp;&nbsp;&nbsp;&nbsp;Oral and Maxillofacial Radiology | 1223X0008X |
| &nbsp;&nbsp;&nbsp;&nbsp;Oral and Maxillofacial Surgery | 1223S0112X |
| &nbsp;&nbsp;&nbsp;&nbsp;Orthodontics and Dentofacial Orthopedics | 1223X0400X |
| &nbsp;&nbsp;&nbsp;&nbsp;Pediatric Dentistry | 1223P0221X |
| &nbsp;&nbsp;&nbsp;&nbsp;Periodontics | 1223P0300X |
| &nbsp;&nbsp;&nbsp;&nbsp;Prosthodontics | 1223P0700X |

### Data Processing

To focus our research, we filtered the National Provider Identifier (NPI) database from 2005 to 2023 to extract specific data related to dentists practicing in New Hampshire.

Our filter criteria included:

1. **Healthcare Provider Taxonomy**: Records with a Taxonomy code related to "Dentist" (e.g., 122300000X for general dentists, 1223G0001X for general practice, and other specific dental specializations).

2. **Provider Business Practice Location Address State Name**: Records indicating the state of the provider's business practice location as "New Hampshire" (NH).

Through this method, we compiled a focused dataset of dental healthcare providers in New Hampshire spanning the years 2005 to 2023.

### Problems

#### 1. Lack of Affiliation Link
In the National Provider Identifier (NPI) database, both individual and organizational healthcare providers are assigned unique identifiers. However, the database does not explicitly delineate the affiliation between individual providers and their associated organizations.

While both an individual and an organization may be present in the database, their affiliation is often only indirectly inferred, such as by matching addresses. (Example: search 33 BROAD ST on [NIP.csv](Data/Processed/NPI.csv)) This method is not consistently accurate and can lead to potential mismatches or non-match.

> **Note:** Although there is a variable named "Affiliation" in the endpoint data, the endpoint data is not a full sample and contains repeated records.

#### 2. Snapshot Data, Not Historical
The NPI database, currently available for direct download, only provides the latest snapshot data for each NPI, devoid of any historical data. A potential solution could involve directly contacting CMS to inquire about the possibility of obtaining the NPI database from the past few years. Considering that this database is updated monthly, it should be adequate to obtain the version from the same month for each year.

**CMS Email:** [NPIFiles@cms.hhs.gov](mailto:NPIFiles@cms.hhs.gov)
