job "j-word-counter" {

    datacenters = ["dc1"]
    type = "service"

    group "g-word-counter" {

        scaling {
            enabled = true
            min = 3
            max = 5
        }

        task "t-word-counter" {

            driver = "docker"

            config {
                image = "ghcr.io/carlosost/word_counter/word_counter:latest"
            }

            env {
                PORT = "${NOMAD_PORT_http}"
            }

            resources {
                network {
                    port "http" {}
                }
            }

            service {
                name = "word-counter"
                port = "http"
                
                tags = [
                    "macbook",
                    "urlprefix-/",
                ]

                check {
                    type     = "http"
                    path     = "/"
                    interval = "2s"
                    timeout  = "2s"
                }
            }
        }
    }
}