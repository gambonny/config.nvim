return {
  "LeonHeidelbach/trailblazer.nvim",
  config = true,
  opts = {
    auto_save_trailblazer_state_on_exit = true,
    auto_load_trailblazer_state_on_enter = true,
    mappings = {
      nv = {
        motions = {
          new_trail_mark = "<A-/>",
          track_back = "<A-b>",
          peek_move_next_down = "<A-J>",
          peek_move_previous_up = "<A-K>",
          move_to_nearest = "<A-v>",
          toggle_trail_mark_list = "<A-m>",
        },
        actions = {
          delete_all_trail_marks = "<A-L>",
          paste_at_last_trail_mark = "<A-p>",
          paste_at_all_trail_marks = "<A-P>",
          set_trail_mark_select_mode = "<A-t>",
          switch_to_next_trail_mark_stack = "<A-.>",
          switch_to_previous_trail_mark_stack = "<A-,>",
          set_trail_mark_stack_sort_mode = "<A-s>",
        },
      },
    },
  },
}
