import time

from flask import Flask

# Criando uma instância do aplicativo Flask
app = Flask(__name__)

# Definindo a rota padrão
@app.route('/')
def root():
    return f"Server Running: {time.time()}"

@app.route('/ping')
def ping():
    return "OK"

# Executando o aplicativo na porta 5000
if __name__ == '__main__':
    app.run(debug=False, port=5000)