load("@build_bazel_rules_nodejs//internal/common:node_module_info.bzl", "collect_node_modules_aspect")
load("@build_bazel_rules_nodejs//internal/common:sources_aspect.bzl", "sources_aspect")

_DOC = """TODO"""

_ATTRS = {
    "bundler": attr.label(
        executable = True,
        cfg = "host",
    ),
    "config": attr.label(
        mandatory = True,
        allow_single_file = [".js", ".ts"],
    ),
    "data": attr.label_list(allow_files = True),
    "deps": attr.label_list(
        aspects = [collect_node_modules_aspect, sources_aspect],
    ),
    "entry": attr.label(
        mandatory = True,
        allow_single_file = [".js", ".ts", ".jsx", ".tsx"],
    ),
    "outputs": attr.output_list(mandatory = True),
}

def _no_ext(f):
    return f.short_path[:-len(f.extension) - 1]

def _bundle_impl(ctx):
    args = ctx.actions.args()
    args.add("--mode=production")
    args.add("--output={output}".format(output = ctx.outputs.outputs[0].path))

    # TODO: this path should be execroot-relative
    # so it shouldn't need the ctx.workspace_name prefix
    args.add("--entry={entry}".format(entry = ctx.workspace_name + "/" + _no_ext(ctx.file.entry)))
    args.add("--config={config}".format(config = ctx.workspace_name + "/" + _no_ext(ctx.file.config)))
    ctx.actions.run(
        inputs = ctx.files.data,
        tools = [ctx.executable.bundler],
        executable = ctx.executable.bundler,
        outputs = ctx.outputs.outputs,
        progress_message = "Building webpack bundle %s" % ctx.outputs.outputs[0].short_path,
        arguments = [args],
    )

webpack_bundle = rule(
    implementation = _bundle_impl,
    doc = _DOC,
    attrs = _ATTRS,
)
