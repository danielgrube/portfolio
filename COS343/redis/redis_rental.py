import psycopg2
import redis

class PostgresLoader:
    def __init__(self, connString):
        self.connection = psycopg2.connect(connString)
        print(self.connection)
        self.curr = self.connection.cursor()
        print(self.curr)

    def get_actor_table(self):
        self.curr.execute("SELECT * FROM actor")
        return self.curr.fetchall()

    def get_film_table(self):
        self.curr.execute("SELECT * FROM film")
        return self.curr.fetchall()

    def get_category_table(self):
        self.curr.execute("SELECT * FROM category")
        return self.curr.fetchall()

    def get_film_actor_table(self):
        self.curr.execute("SELECT * FROM film_actor")
        return self.curr.fetchall()

    def get_film_category_table(self):
        self.curr.execute("SELECT * FROM film_category")
        return self.curr.fetchall()


class DvdRental():
    def __init__(self, connString):
        self.pg = PostgresLoader(connString)
        self.redis = Redis()

    def populate_actor(self):
        actor_list = self.pg.get_actor_table()
        for i in actor_list:
            ID = 'Actor_' + str(i[0])

    def populate_film(self):
        film_list = self.pg.get_film_table()
        for i in film_list:
            ID = 'Film_' + str(i[0])
            self.redis.set_a_hash(ID, 'title', str(i[1]))
            self.redis.set_a_hash(ID, 'description', str(i[2]))
            self.redis.set_a_hash(ID, 'release_year', str(i[3]))
            self.redis.set_a_hash(ID, 'language_id', str(i[4]))
            self.redis.set_a_hash(ID, 'rental_duration', str(i[5]))
            self.redis.set_a_hash(ID, 'rental_rate', str(i[6]))
            self.redis.set_a_hash(ID, 'length', str(i[7]))
            self.redis.set_a_hash(ID, 'replacement_cost', str(i[8]))
            self.redis.set_a_hash(ID, 'rating', str(i[9]))
            self.redis.set_a_hash(ID, 'special_features', str(i[10]))
            self.redis.set_a_hash(ID, 'full_text', str(i[11]))

    def populate_category(self):
        category_list = self.pg.get_category_table()
        for i in category_list:
            ID = 'Catgegory_' + str(i[0])
            self.redis.set_a_hash(ID, 'category_name', str(i[1]))

    def populate_actor_list(self):
        film_actor_list = self.pg.get_film_actor_table()
        film_list = self.pg.get_film_table()
        for i in film_actor_list:
            actor_id = 'actor_' + str(i[0])
            for j in film_list:
                if j[0] == i[1]:
                    self.redis.set_a_list(actor_id, j[1])

    def populate_film_list(self):
        film_actor_list = self.pg.get_film_actor_table()
        actor_list = self.pg.get_actor_table()
        for i in film_actor_list:
            film_id = 'film_ ' + str(i[1])
            for j in actor_list:
                if j[0] == i[0]:
                    self.redis.set_a_list(film_id, j[1] + j[2])

    def populate_category_list(self):
        film_category_list = self.pg.get_film_category_table()
        film_list = self.pg.get_film_table()
        for i in film_category_list:
            category_id = 'category_' + str(i[1])
            for j in film_list:
                if j[0] == i[0]:
                    self.redis.set_a_list(category_id, j[1])

    def get_actor_hash(self, actor_id):
        return self.redis.get_a_hash('Actor_' + str(actor_id))

    def get_actor_list(self, actor_id):
        return self.redis.get_a_list('actor_' + str(actor_id))

    def get_film_hash(self, film_id):
        return self.redis.get_a_hash('Film_' + str(film_id))

    def get_film_list(self, film_id):
        return self.redis.get_a_list('film_' + str(film_id))

    def get_category_hash(self, category_id):
        return self.redis.get_a_hash('Category_' + str(category_id))

    def get_category_list(self, category_id):
        return self.redis.get_a_list('category_' + str(category_id))


class Redis:
    def __init__(self):
        self.connection = redis.StrictRedis(host='faraday.cse.taylor.edu', port=6403)

    def set_a_string(self, key, value):
        return self.connection.set(key, value)

    def get_a_string(self, key):
        return self.connection.get(key)

    def delete_a_string(self, key):
        return self.connection.delete(key)

    def set_a_hash(self, key, subkey, value):
        return self.connection.hset(key, subkey, value)

    def get_a_hash(self, key):
        return self.connection.hgetall(key)

    def delete_a_hash(self, key, subkey):
        return self.connection.hdel(key, subkey)

    def set_a_list(self, key, value):
        return self.connection.rpush(key, value)

    def get_a_list(self, key):
        return self.connection.lrange(key, 0, -1)



