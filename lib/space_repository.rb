require_relative './space'

class SpaceRepository

    def all
      # Executes the SQL query:
      sql= 'SELECT id, name, description, price, user_id FROM spaces;'
      result_set = DatabaseConnection.exec_params(sql, [])
      spaces = []
      result_set.each do |record|
        space = Space.new
        space.id = record['id'].to_i
        space.name = record['name']
        space.description = record['description']
        space.price = record['price']
        space.user_id = record['user_id'].to_i
        spaces << space
      end
      return spaces
    end
  
    def find(id)
      # Executes the SQL query:
      sql = 'SELECT id, name, description, price, user_id FROM spaces where id = $1;'
      result_set = DatabaseConnection.exec_params(sql, [id])
      record = result_set.first
        space = Space.new
        space.id = record['id'].to_i
        space.name = record['name']
        space.description = record['description']
        space.price = record['price']
        space.user_id = record['user_id'].to_i
      return space

    end
  
    # Add more methods below for each operation you'd like to implement.
  
     def create(space)
      # Executes the SQL query:
      sql = 'INSERT INTO spaces (name, description, price, user_id)  VALUES ($1, $2, $3, $4);'
      sql_params = [space.name, space.description, space.price, space.user_id]
      DatabaseConnection.exec_params(sql, sql_params)
      return ''  
     end
    # To be decided --- nice to have for user to update and delete spaces if he wants to 
    # def update(student)
    # end
  
    # def delete(student)
    # end
  end