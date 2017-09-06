class Item < ApplicationRecord

	has_many :logs, dependent: :destroy
	has_one :current, -> { where return_date: nil }, class_name: "Log"
	validates :description, presence: true



   # def self.execute_statement(sql)
   #      results = self.connection.execute(sql)
   #      if results.present?
   #          return results
   #      else
   #          return nil
   #      end
   #  end
   #    results = execute_statement("SELECT * FROM items")

   # r = Item.connection.execute("SELECT * FROM items")
    def self.due_check    


   end



end
