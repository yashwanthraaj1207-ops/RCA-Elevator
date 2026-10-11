# ELEVATOR-RCA

> **Explainable Causal AI for Intelligent Elevator Fault Detection, Isolation & RootCause Analysis**  
> *"Don't just detect the fault — investigate why it happened."*

---

## 📌 Project Overview

**ELEVATOR-RCA** is an industrial-grade intelligent monitoring and root-cause analysis (RCA) software prototype. Rather than presenting a generic alert that a system anomaly occurred, ELEVATOR-RCA investigates the underlying sensor evidence across multiple physical domains (thermal, phase current, velocity kinematics, and triaxial vibration) to isolate the root cause and provide clear human-readable explanations alongside an interactive causal dependency graph.

### Academic Stage & Transparency
- **Project Stage:** First basic software prototype for an academic engineering curriculum (second-year / final-year capstone).
- **Prototype Diagnostic Logic:** Deterministic, rule-based simulation demonstrating explainability without deceptive AI claims.
- **Disclaimer:** *This prototype uses simulated sensor data and rule-based diagnostic logic for demonstration purposes. It is not a validated industrial elevator safety or maintenance system.*

---

## 🚀 Key Features

1. **System Health & Hoistway Schematic (Overview)**
   - High-level system health metrics, cruise speed, vertical travel direction, and live payload readout.
   - Custom CAD-style Hoistway Cross-Section visualization showing the overhead machine room, traction motor, hoisting cables, elevator cabin, guide rails, counterweight, and sensor connection pins.
   - Interactive component inspector slide-over displaying component specifications, operational limits, baseline parameters, and diagnostic notes.
   - Real-time sparkline telemetry cards for Motor Temperature, Motor Current, Vibration (IMU), Elevator Speed, and Cabin Floor Position.

2. **Continuous Live Monitoring**
   - Rolling synchronized time-series charts powered by **Recharts**:
     - Motor Stator Temperature (°C) with 95°C thermal alarm threshold.
     - Stator Phase Current (A) with 28A overload trip threshold.
     - Composite Vibration (g) with 0.8g ISO 18738 ride quality limit.
     - Traction Cruise Speed (m/s) with 1.0 m/s velocity derating threshold.
   - Comprehensive simulation controls: Play/Resume, Pause, Reset, and instantaneous scenario switching.

3. **Explainable Root Cause Analysis (Fault Analysis — Centerpiece)**
   - **Fault Result:** Classified fault name, severity rating (Normal, Low, Medium, High, Critical), and diagnostic confidence percentage.
   - **Quantitative Sensor Evidence:** Direct comparison between baseline nominal ratings and active telemetry with percentage delta shifts and physical interpretations.
   - **Root Cause Determination:** Clear identification of the origin mechanism.
   - **WHY? Narrative:** Human-readable engineering rationale explaining the causal physics.
   - **Deterministic Causal Dependency Graph (RCA Chain):** Interactive multi-stage graph mapping origin causes &rarr; mechanical mechanisms &rarr; thermal effects &rarr; observable symptoms with deep-dive inspection drawers.

4. **Audit Event Log & Chronology (Event History)**
   - Chronological record of system status transitions and fault incidents.
   - Filterable by severity: *All*, *Critical*, *Warning*, and *Healthy*.
   - Live search filter and CSV export functionality.
   - Incident snapshot inspection modal with one-click "Replay Scenario in RCA".

---

## 🔬 Monitored Subsystems & Sensors

| Component | Type | Location | Baseline / Nominal | Monitored Parameters |
| :--- | :--- | :--- | :--- | :--- |
| **Traction Motor** | Electrical Machine | Overhead Machine Room | 72°C / 18.4A RMS | Temperature, Phase Current, RPM |
| **Elevator Cabin** | Mechanical Car | Hoistway Center | 1.8 m/s cruise | Speed, Floor, Payload, Vibration |
| **Guide Rails** | Mechanical Track | Lateral Shaft Flanks | < 0.45g vibration | Lateral Acceleration, Alignment |
| **Counterweight** | Mechanical Ballast | Rear Shaft Flank | 1450 kg (45% balance) | Balance Ratio, Rope Tension |
| **PT100 Temp Sensor** | Sensor Probe | Motor Stator End-Turn | 65–80°C | Core Winding Thermal Flux |
| **Hall Current Sensor** | Current Transducer | Inverter Phase Output | 14–22A RMS | Phase Current Draw & Balance |
| **3-Axis IMU** | Accelerometer | Cabin Crosshead | 0.15–0.45g | Ride Comfort Index (ISO 18738) |
| **Optical Encoder** | Rotary Encoder | Traction Sheave Shaft | 1.80 m/s (±0.02) | Velocity & Hoistway Position |
| **Safety System** | Electromechanical | Cabin Base & Machine | 24V DC Closed | Progressive Wedge Clamps, Brake |

---

## ⚙️ Operating Scenarios

1. **Normal Operation:** System operates within standard tolerances (72°C, 18.4A, 0.32g, 1.80 m/s).
2. **Motor Overheating:** High motor current (27.8A, +51%) drives stator temperature to 104°C (+44%) while speed rolls back to 1.2 m/s; vibration remains normal (0.38g). *Root Cause: Excessive motor load & thermal stress.*
3. **Excessive Load:** Current surges to 32.4A (+76%) under 1120 kg cabin payload, derating velocity to 1.15 m/s. *Root Cause: Elevator operating near or above continuous payload duty limit.*
4. **Mechanical Vibration:** IMU detects severe oscillation spike (1.45g, +326%) while motor temperature and current remain perfectly nominal. *Root Cause: Guide rail track irregularity or roller guide shoe wear.*
5. **Traction Motor Fault:** Severe phase current distortion (29.8A) and thermal rise (98.4°C) trigger critical speed drop (0.75 m/s) with 0.82g shudder. *Root Cause: Internal stator winding degradation & flux asymmetry.*

---

## 🛠️ Technology Stack

- **Framework:** React 19 + TypeScript
- **Bundler:** Vite 8
- **Styling:** Tailwind CSS v4 (Industrial Charcoal/Graphite design system)
- **Charting:** Recharts
- **Icons:** Lucide React
- **Data Engine:** Deterministic in-memory simulation engine with exponential smoothing & micro-noise generation

---

## 💻 Running the Prototype Locally

### Prerequisites
- Node.js (v18+)
- npm

### 1. Install Dependencies
```bash
npm install
```

### 2. Start the Development Server
```bash
npm run dev
```
Open your browser at:  
👉 **`http://localhost:5173/`**

### 3. Build for Production
```bash
npm run build
```

---

## 🧭 Project Architecture

```
ELEVATOR_RCA/
├── src/
│   ├── components/
│   │   ├── ComponentPanel.tsx      # Subsystem detail inspector slide-over
│   │   ├── DisclaimerModal.tsx     # Academic transparency & roadmap modal
│   │   ├── ElevatorVisualization.tsx# Custom SVG CAD Hoistway schematic
│   │   ├── EventTable.tsx          # Filterable event audit log
│   │   ├── FaultAlert.tsx          # Dynamic fault detection alert banner
│   │   ├── IntroTransition.tsx     # Product-introduction transition
│   │   ├── RCAChain.tsx            # Interactive DAG causal reasoning graph
│   │   ├── SensorCard.tsx          # Sparkline telemetry cards
│   │   ├── Sidebar.tsx             # Main client navigation & status footer
│   │   ├── StatusBadge.tsx         # Industrial status indicators
│   │   └── TopBar.tsx              # Scenario switcher & simulation controls
│   ├── charts/
│   │   └── ChartCard.tsx           # Recharts time-series wrapper
│   ├── data/
│   │   ├── components.ts           # 9 elevator subsystems & sensor hardware
│   │   └── scenarios.ts            # 5 deterministic simulation scenarios
│   ├── hooks/
│   │   └── useElevatorSimulation.ts# Global state hook & reactive ticker
│   ├── logic/
│   │   └── diagnostic.ts           # Deterministic rule-based RCA engine
│   ├── pages/
│   │   ├── OverviewPage.tsx        # System health & schematic view
│   │   ├── LiveMonitoringPage.tsx  # 4 rolling Recharts telemetry graphs
│   │   ├── FaultAnalysisPage.tsx   # Root Cause Analysis centerpiece
│   │   └── EventHistoryPage.tsx    # Chronological audit log & replay
│   ├── simulation/
│   │   └── engine.ts               # Telemetry generator with physics smoothing
│   ├── types/
│   │   └── index.ts                # TypeScript interfaces & domain types
│   ├── App.tsx                     # Main application layout
│   ├── index.css                   # Tailwind v4 theme & industrial styling
│   └── main.tsx                    # React application entry point
├── package.json
├── tsconfig.json
├── vite.config.ts
└── README.md
```

---

## 🛡️ Future Extensibility (Academic Roadmap)

Although V1 strictly avoids unnecessary complexity and black-box models, the codebase is cleanly modularized to facilitate future research phases:
- **Phase 1:** Real Telemetry Ingestion (MQTT / OPC-UA IoT gateways).
- **Phase 2:** Unsupervised Machine Learning for Anomaly Detection (Autoencoders & Isolation Forests).
- **Phase 3:** Automated Causal Discovery DAGs (PC algorithm & Structural Causal Models).
- **Phase 4:** Counterfactual Inference & Pearl's *do-calculus* for predictive maintenance.

---

## 👥 Project Team

The ELEVATOR-RCA team combines software development, AI-oriented diagnostic design, and systematic testing to build an explainable elevator fault-analysis prototype.

| Team Member | Role | Responsibilities |
|---|---|---|
| **M Huzaifa** | Lead Developer & System Integration | Application development, UI integration, simulation workflow, and project coordination |
| **S Yashwanth Raaj** | AI & Causal Reasoning Engineer | Diagnostic logic, causal reasoning concepts, and explainability of fault-analysis outputs |
| **Hrithik K** | Testing & Validation Engineer | Scenario testing, checking diagnostic behaviour, reviewing interface interactions, and documenting limitations |

**Project status:** This academic prototype uses simulated sensor data and deterministic, rule-based diagnostic logic. It has not been validated as an industrial elevator safety or maintenance system.
