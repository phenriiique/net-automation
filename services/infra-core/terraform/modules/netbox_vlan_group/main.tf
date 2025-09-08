locals {
  # Gera slug automaticamente se não fornecido
  # Remove acentos e caracteres especiais, converte para lowercase e substitui espaços por hífens
  vlan_group_slug = var.slug != null ? var.slug : lower(
    replace(
      replace(
        replace(
          replace(
            replace(
              replace(
                replace(
                  replace(
                    replace(
                      replace(
                        replace(
                          replace(var.name, "á", "a"),
                          "à", "a"
                        ),
                        "ã", "a"
                      ),
                      "â", "a"
                    ),
                    "é", "e"
                  ),
                  "ê", "e"
                ),
                "í", "i"
              ),
              "ó", "o"
            ),
            "ô", "o"
          ),
          "ú", "u"
        ),
        " ", "-"
      ),
      "[^a-z0-9-]", ""
    )
  )
}

resource "netbox_vlan_group" "this" {
  name        = var.name
  slug        = local.vlan_group_slug
  description = var.description
  vid_ranges  = var.vid_ranges
  tags        = var.tags
}
