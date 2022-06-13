local helpers = {}

function helpers.warn(msg, name)
  vim.notify_once(msg, vim.log.levels.WARN, { title = name })
end

function helpers.error(msg, name)
  vim.notify_once(msg, vim.log.levels.ERROR, { title = name })
end

function helpers.info(msg, name)
  vim.notify_once(msg, vim.log.levels.INFO, { title = name })
end

return helpers
