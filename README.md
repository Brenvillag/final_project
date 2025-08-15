
# 🌍GLOBAL TO LOCAL: LEED SUSTAINABILITY INSIGHTS
A Data Analysis of Green Building Performance

# 📌Project overview
This project analyzes LEED-certified buildings globally, with a focus on the USA and Spain, to assess their real-world impact on sustainability metrics. LEED certification drives green building adoption, but its contribution to national environmental goals is not always clear. The project provides actionable insights for policymakers, developers, and sustainability consultants.

Objectives:
•  Analyze global and regional LEED-certified building data
•  Identify leaders and gaps in green building adoption
•  Deliver insights to inform policy and guide sustainable development strategies

# 📂 Datasets
•	Global LEED Certifications Dataset (2024–2025)
https://www.usgbc.org/projects 
•	World Energy Consumption Dataset
https://www.kaggle.com/datasets/pralabhpoudel/world-energy-consumption
•	Estimated emission factors and sustainability benchmarks
https://arc.gbci.org/guides

# 🛠 Tools & Technologies
•  Data Analysis & Cleaning: Python (pandas, NumPy, scipy)
•  Data Visualization: Tableau, Matplotlib, Seaborn
•  Database & Querying: SQL
•  Data Wrangling & Integration: Python scripts for merging, cleaning, and imputing missing values

# 🔧 Data Cleaning & Wrangling
•  Imported raw LEED dataset into Python for preprocessing
•  Handled missing values and standardized different formats across columns
•  Filtered out irrelevant information to focus on key sustainability indicators
•  Calculated sustainability metrics (energy, water, waste, emissions) using external country level baselines
•  Created new dataframes with usage percentages and savings per project
•  Built a SQL database and imported cleaned tables using pandas and numpy
•  Prepared data for Exploratory Data Analysis (EDA) and visualizations in Tableau

# 📊 Exploratory Data Analysis (EDA)
•  Key Metrics Analyzed
Country, total projects, certification level, gross floor area (sqm)
CO₂ avoided (KgCO₂), energy saving (kWh), water saving (liters), waste saving (tons)

•  Insights Gained
Geographic patterns: Global and regional visualizations show LEED adoption hotspots.
Trends over time: Shifts in project types and certification levels.
Performance rankings: Country-level leaders and laggards in energy, CO₂, waste, and water savings.

•  Statistical Analysis
Hypothesis testing: Used ANOVA and Spearman’s correlation to explore links between certification level and energy savings.
Findings: Higher certifications often align with greater energy savings, offering guidance for developers and policymakers.

# ⚠️ Major Obstacles & Solutions
•  No existing sustainability metrics → research and engineered new features for analysis
•  Preparing data for SQL and Tableau → ERM , ERD, Structured tables for queries and dashboards
• Ensuring clarity for visualization → used dashboards to tell the stroy visually

# 📝 Key Insights & Conclusions
•  LEED buildings drive significant energy savings, with impacts varying by country.
•  Top performers: China leads; India and the US show strong but uneven results.
•  Higher LEED certification levels link to greater energy efficiency (ANOVA p = 0.00, Spearman r = 0.43).
•  Heatmaps reveal adoption gaps and highlight country sustainability strengths.
•  Actionable Takeaway: Targeted policies and incentives can maximize energy efficiency and environmental benefits.

# 📈 Visualizations
•  Interactive global & regional LEED adoption maps: Dashboard 1 GLobal Overview-->Dashboard 2 Region and Project Types (US)-->Dashboard 3 Region and Project Types (ES)
•  Country-level sustainability impact rankings
•  Certification-level vs energy savings correlation charts

# 🔗Links
Presentation: https://docs.google.com/presentation/d/1x8Jq8jGE7SmCcKPlQEARAYq503F9XYlLPbst67xwtmk/edit?slide=id.p#slide=id.p
Public Tableau: https://public.tableau.com/app/profile/brenda.villaverde.garcia/viz/Global_to_local_project/GLOBALTOLOCALLEEDSUSTAINABILITYINSIGHTS
Extra sources:  https://trello.com/b/c7vxOH80/global-to-local-leed-sustainability-insights-data-analytics-end-to-end

## 🗃️ Repository Structure

final_project/
📁 .git
📄 .gitignore
📁 .ipynb_checkpoints
📄 .python-version
📁 .venv
📄 config.yaml
📁 data
📄 main.py
📁 notebooks
📄 pyproject.toml
📄 README.md
📄 requirements.txt
📁 sql
📁 src
📁 tableau
📄 uv.lock


# 💻 Installation

1. **Clone the repository**:

```bash
git clone  https://github.com/Brenvillag/final_project
```

2. **Install UV**

If you're a MacOS/Linux user type:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

If you're a Windows user open an Anaconda Powershell Prompt and type :

```bash
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

3. **Create an environment**

```bash
uv venv 
```

3. **Activate the environment**

If you're a MacOS/Linux user type (if you're using a bash shell):

```bash
source ./venv/bin/activate
```

If you're a MacOS/Linux user type (if you're using a csh/tcsh shell):

```bash
source ./venv/bin/activate.csh
```

If you're a Windows user type:

```bash
.\venv\Scripts\activate
```

4. **Install dependencies**:

```bash
uv pip install -r requirements.txt







