locals {
    type = var.type
    storage_provider = var.storage_provider
    env_auth = false
    region = var.region
    access_key_id = var.access_key_id
    secret_access_key = var.secret_access_key
    endpoint = var.endpoint
    bin_dir        = module.setup_clis.bin_dir
    name = var.name
    rcaction=var.rcaction

}

module "setup_clis" {
    source = "github.com/indirakalagara/terraform-util-clis.git"
    clis = ["rclone"]
}

resource null_resource rclone-config-create {
  count = local.rcaction == "create"  ? 1 : 0
  triggers = {
    bin_dir   = local.bin_dir
    name      = local.name
    type         = local.type
    storage_provider        = local.storage_provider
    env_auth       = local.env_auth
    region       = local.region
    access_key_id           = var.access_key_id
    secret_access_key        = var.secret_access_key
    endpoint          = local.endpoint
  }
    depends_on = [
    module.setup_clis
  ]

  provisioner "local-exec" {
    when    = create
    command = "${path.module}/scripts/create-rclone-config.sh"

    environment = {
      BIN_DIR       = self.triggers.bin_dir
      NAME = self.triggers.name
      TYPE      = self.triggers.type
      STORAGE_PROVIDER  = self.triggers.storage_provider
      ENV_AUTH  = self.triggers.env_auth
      REGION    = self.triggers.region
      ACCESS_KEY_ID     = local.access_key_id
      SECRET_ACCESS_KEY = local.secret_access_key
      ENDPOINT  = self.triggers.endpoint
     
     }
  }
}

resource null_resource rclone-copy{
  count = local.rcaction == "copy"  ? 1 : 0  
  triggers = {
    bin_dir   = local.bin_dir
    src_provider  = var.src_provider
    dest_provider = var.dest_provider    
    src_bucket = var.src_bucket
    dest_bucket = var.dest_bucket
    file_name = var.file_name    
  }
    depends_on = [
    module.setup_clis
  ]
  

  provisioner "local-exec" {
    when    = create
    command = "${path.module}/scripts/copy-rclone.sh"
    environment = {
      BIN_DIR       = self.triggers.bin_dir
      SRC_PROVIDER = self.triggers.src_provider
      DEST_PROVIDER = self.triggers.dest_provider
      SRC_BUCKET  = self.triggers.src_bucket
      DEST_BUCKET  = self.triggers.dest_bucket
      FILE_NAME = self.triggers.file_name     
     }
  }
}

