return {
  "nvim-telescope/telescope-fzf-native.nvim",
  build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cd build && make",
  config = function()
    require("telescope").load_extension("fzf")
  end,
}
