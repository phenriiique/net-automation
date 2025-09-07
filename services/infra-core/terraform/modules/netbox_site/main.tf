locals {
  # Gera slug automaticamente se não fornecido
  # Remove acentos e caracteres especiais, converte para lowercase e substitui espaços por hífens
  site_slug = var.slug != null ? var.slug : lower(
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
    )
  )
}

resource "netbox_site" "this" {
  name        = var.name
  slug        = local.site_slug
  description = var.description
  status      = var.status
  tenant_id   = var.tenant_id
}
