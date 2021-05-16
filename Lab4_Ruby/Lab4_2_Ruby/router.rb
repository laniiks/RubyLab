module Resource
    def connection(routes)
      if routes.nil?
        puts "No route matches for #{self}"
        return
      end
  
      loop do
        print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
        verb = gets.chomp
        break if verb == 'q'
  
        action = nil
  
        if verb == 'GET'
          print 'Choose action (index/show) / q to exit: '
          action = gets.chomp
          break if action == 'q'
        end
  
  
        action.nil? ? routes[verb].call : routes[verb][action].call
      end
    end
  end
  
  class PostsController
    extend Resource
  
    def initialize
      @posts = []
    end
  
    def index
      puts 'Все посты: '
      @posts.each_with_index do |posts, index|
        print index
        print ": "
        puts posts 
      end
    end
  
    def show
      print 'Введите id поста который хотите вывести: '
      id = gets.to_i
      puts @posts[id]
    end
  
    def create
      print 'Введите заголовок поста: '
      title = gets.chomp
      @posts.push(title)
    end
  
    def update
      print 'Введите id поста для изменения: '
      id = gets.to_i
      puts @posts[id]
      print 'Введите новый заголовое поста: '
      title = gets.chomp
      @posts[id] = title
    end
  
    def destroy
      print 'Введите id поста который хотите удалить: '
      id = gets.to_i
      @posts.delete_at(id)
    end
  end

  class CommentsController
    extend Resource
  
    def initialize
      @comments = []
    end
  
    def index
      puts 'Все коментарии: '
      @comments.each_with_index do |comments, index|
        print index
        print ": "
        puts comments 
      end
    end
  
    def show
      print 'Введите id коментария который хотите вывести: '
      id = gets.to_i
      puts @comments[id]
    end
  
    def create
      print 'Введите заголовок коментария: '
      title = gets.chomp
      @comments.push(title)
    end
  
    def update
      print 'Введите id коментария для изменения: '
      id = gets.to_i
      puts @comments[id]
      print 'Введите новый заголовое коментария: '
      title = gets.chomp
      @comments[id] = title
    end
  
    def destroy
      print 'Введите id коментария который хотите удалить: '
      id = gets.to_i
      @comments.delete_at(id)
    end
  end
  
  class Router
    def initialize
      @routes = {}
    end
  
    def init
      resources(PostsController, 'posts')
      resources(CommentsController, 'comments')
  
      loop do
        print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
        choise = gets.chomp
  
        PostsController.connection(@routes['posts']) if choise == '1'
        CommentsController.connection(@routes['comments']) if choise == '2'
        break if choise == 'q'
      end
  
      puts 'Good bye!'
    end
  
    def resources(klass, keyword)
      controller = klass.new
      @routes[keyword] = {
        'GET' => {
          'index' => controller.method(:index),
          'show' => controller.method(:show)
        },
        'POST' => controller.method(:create),
        'PUT' => controller.method(:update),
        'DELETE' => controller.method(:destroy)
      }
    end
  end
  
  router = Router.new
  
  router.init