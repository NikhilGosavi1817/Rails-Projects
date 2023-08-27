module ApplicationHelper
    def sortable(column, title = nil, filter)
        title ||= column.titleize
        direction = (column == params[:sort] && params[:direction] == "desc") ? "asc" : "desc"
        link_to title, { sort: column, direction: direction , filter: filter }, { class: "sortable" }
      end
    
      def sorting_table(sort)
        sort_column=params[:sort]
        sort_direction= params[:direction] || "desc"
        sort.order("#{sort_column} #{sort_direction}")
      end
end
