import numpy as np
import matplotlib.pyplot as plt


# ============================================================
# Input files
# ============================================================

av_file = "obj-4-a-50.txt"
min_file = "obj-4-a-05.txt"
max_file = "obj-4-a-95.txt"


# ============================================================
# Read data
# ============================================================

# Files are semicolon-separated.
# Column 0 = x-axis
# Column 1 = ignored
# Columns 2-7 = six quantities to plot

av = np.loadtxt(av_file, delimiter=";")
minimum = np.loadtxt(min_file, delimiter=";")
maximum = np.loadtxt(max_file, delimiter=";")


# ============================================================
# Extract data
# ============================================================

x = av[:, 0]

# Six curves
n_curves = 6

labels = [
    r"$K=10$",
    r"$K=50$",
    r"$K=100$",
    r"M1",
    r"M2",
    r"M3"
]

linestyles = ["--", ":", "-.", "-", "-", "-"]

colors = [
    "black",
    "black",
    "black",
    "#f48766",
    "#d24099",
    "#7500db"
]

# Column 1 is ignored, so data starts at column 2
for i in range(n_curves):

    avg = av[:, i + 2]/av[:, 2]
    min_val = minimum[:, i + 2]/av[:, 2]
    max_val = maximum[:, i + 2]/av[:, 2]

    # Plot average
    plt.plot(
        x,
        avg,
        linewidth=2,
        linestyle=linestyles[i],
        label=labels[i],
        color=colors[i]
    )

    # Plot min-max shaded region
    plt.fill_between(
        x,
        min_val,
        max_val,
        alpha=0.1,
        color=colors[i]
    )


# ============================================================
# Plot formatting
# ============================================================

plt.xlabel(r"$n$")
plt.ylabel(r"Objective ratio to $K=10$")

plt.xscale("log")


plt.legend()

plt.grid(True, which="both", alpha=0.1)

plt.tight_layout()

plt.xticks(x, [str(int(v)) for v in x])

plt.savefig("plot-obj-4-a.pdf", bbox_inches="tight")
# plt.show()
