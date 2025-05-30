local config = {
    cmd = {'jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'.idea', 'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    settings = {
        java = {
            inlayHints = { parameterNames = { enabled = "all" } },
            signatureHelp = { enabled = true },
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-21",
                        path = "/usr/lib64/jvm/java-21-openjdk-21/",
                    },
                }
            },
        }
    }
}
require('jdtls').start_or_attach(config)

vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
