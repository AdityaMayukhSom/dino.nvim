local status_ok, code_runner = pcall(require, "code_runner")

if not status_ok then
	vim.notify("code runner not working")
	return
end

code_runner.setup({
	mode = "toggleterm",
	filetype = {
		cpp = {
			"cd $dir &&",
			"g++ -o $fileNameWithoutExt $fileName -std=c++17 -O2 -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -Wno-unused-result -Wno-sign-conversion &&",
			"./$fileNameWithoutExt",
		},
		java = {
			"cd $dir &&",
			"javac $fileName &&",
			"java $fileNameWithoutExt",
		},
		python = "python3 -u",
		rust = {
			"cd $dir &&",
			"rustc $fileName &&",
			"$dir/$fileNameWithoutExt",
		},
	},
})
