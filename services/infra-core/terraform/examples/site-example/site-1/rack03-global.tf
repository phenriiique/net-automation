# Racks Globais - Instanciação no site-1
# Este arquivo instancia os racks globais no contexto do site-1

# module "racks_global" {
#   source = "../../../global/racks"
  
#   # Variáveis do site-1
#   rack_qtd = local.rack_qtd
#   status = local.status_site_rack
# }


# output "racks_global" {
#   description = "Informações dos Racks Globais"
#   value = module.racks_global.racks
# }
# output "rack03_global" {
#   description = "Informações do RACK03 global"
#   value = {
#     servers_balanced = module.racks_global.servers_balanced
#     servers_performance = module.racks_global.servers_performance
#     servers_gpu = module.racks_global.servers_gpu
#     switches_n3248te = module.racks_global.switches_n3248te
#     switches_s5248f = module.racks_global.switches_s5248f
#     summary = module.racks_global.rack03_summary
#   }
# }

# output "racks_global" {
#   description = "Informações dos Racks Globais"
#   value = module.racks_global.racks
# }
