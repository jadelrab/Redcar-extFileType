module Redcar
  class ExtFileType
    
    def self.menus
      Redcar::Menu::Builder.build do
        sub_menu "Plugins" do
            item "Set File Type", SetFileType
        end
      end
    end

    class SetFileType < Redcar::Command
      def execute
        ShowGrammarDialog.new.open
      end
    end

    class ShowGrammarDialog < FilterListDialog
      def initialize
        super
        bundles  = JavaMateView::Bundle.bundles.to_a
        grammars = bundles.map {|b| b.grammars.to_a}.flatten
        @items    = grammars.map {|g| g.name}.sort_by {|name| name.downcase }
        @items
      end

      def close
        super
      end

      def update_list(filter)
        @last_list = @items
        filtered_list = @last_list
        if filter.length >= 1
          filtered_list = filter_and_rank_by(filtered_list, filter, filtered_list.length) do |match|
            match
          end
        end
        filtered_list    
      end

      def selected(text, ix, closing=false)
        tab = Redcar.app.focussed_window.focussed_notebook.focussed_tab
        tab.edit_view.grammar = text
        close
      end
    end

  end
end
