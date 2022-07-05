module "sftp" {
    source = "../"
    enable_sftp   = true
    public_key    = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCoE95+TuZ7mavx0hP2Z0qs/6WybMoic0SH5h6tcH8AmsAfQBlgtRhkCmfrJflVJhwTgMkb5hfauSJ9OsherhKetIra7exKsDzXw+7MThaH1Xmzf16UeOhXeDvEMkDCU89l1ql8HyVdeNu4EhygnN0Bk/TB5AHw5fKhpVTQXpe+DdX1n10YDTL1ueKaSm/jom9eMuTOR4CcrU+M35Lru5gyhnML+6Swdql/D2YVhjlA5VbwnWA3Zbo3nnDIAS46JbJCPekIT2236bd+EE4QihXKi3Ddn4l6KssyK9qyB/e506OfqpssQgQN0d4/aT5OU+M9KEuSk13lBcOHSkejKNCDz6cFZwegM3OiPuCc2gPkIzCvre3IY6WP3Pe19LcnIWOcFhrVyLEgaZrmd5jtA2y3oV0AJ6fXvarvs+MnGQwI/Yfy4ws+oNpdhiRA0lDfRLIUh7wBW3SszRZF9EE5Ob010hoMj9uAwQA8aepf811QeKGVdsSmsitvPYPHs9fk+rW73WWg4gu783LecB15ZnR85apI9mLlpm+YA7OehpDOik4+hzaJLRN50vrZ+5oMyDbkeHlLbwandKg54k6a5DCuixCgy4TsVsfCpzqwN4GU8fZXmPTGX4TW/SFRXVrrgCmbQt/HVIbc7YM3ZsobOWiH9nhCYC04/ALxwDkFds7LRQ== "
    identity_provider_type = "SERVICE_MANAGED"
    endpoint_type = "PUBLIC"
    user_name     = "aaksh"
    s3_bucket_id = "akshaybucket0806"
    common_tags = {
        "Name" = "Aakash"
    }

}