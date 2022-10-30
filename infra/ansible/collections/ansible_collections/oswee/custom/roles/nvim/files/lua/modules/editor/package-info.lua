local ok, npminfo = pcall(require, 'package-info')
if not ok then
	return
end

npminfo.setup()
