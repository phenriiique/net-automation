locals {
  manufacturer_slug = var.slug != null ? var.slug : lower(
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

resource "netbox_manufacturer" "this" {
  name = var.name
  slug = local.manufacturer_slug
}
