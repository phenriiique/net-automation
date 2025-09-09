locals {
  # Gera slug automaticamente se não fornecido
  # Remove acentos e caracteres especiais, converte para lowercase e substitui espaços por hífens
  tag_slug = var.slug != null ? var.slug : lower(
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

resource "netbox_tag" "this" {
  name        = var.name
  slug        = local.tag_slug
  description = var.description
  color_hex   = var.color_hex
}
