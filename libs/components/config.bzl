COMPONENTS = [
    "avatar",
]

# List of all entry point target of the barista components
COMPONENT_TARGETS = ["//libs/components/%s" % c for c in COMPONENTS]
