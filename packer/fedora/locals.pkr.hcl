locals {
  media = {
    "server"      = "dvd"
    "workstation" = "Live"
    "net"         = "netinst"
  }
  type     = "${var.type == "net" ? "server" : lower(var.type)}"
  iso_base = "https://download.fedoraproject.org/pub/fedora/linux/releases/${var.version}/${title(local.type)}/x86_64/iso"
  iso_url  = "${local.iso_base}/Fedora-${title(local.type)}-${lookup(local.media, lower(var.type), title(var.type))}-x86_64-${var.version}-${var.release}.iso"
  iso_checksum = "file:${local.iso_base}/Fedora-${title(local.type)}-${var.version}-${var.release}-x86_64-CHECKSUM"
  /* iso_checksum = "file:https://mirrors.pt/fedora/linux/releases/35/Server/x86_64/iso/Fedora-Server-35-1.2-x86_64-CHECKSUM" */
}
