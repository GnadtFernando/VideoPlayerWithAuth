Teste desenvolvimento mobile focado na construção de um aplicativo voltado ao contexto de
videomonitoramento e que faz uso de uma API. O aplicativo deve atender aos requisitos descritos abaixo:
Requisitos

● Criar uma tela de login que irá autenticar via API.
○ login contém usuário e senha;
○ usuário para teste:
■ usuários: candidato-seventh
■ senha: 8n5zSrYq
○ API para Login
■ Documentação da API: http://mobiletest.seventh.com.br/api-
docs/#/Authorization/post_login
■ Params:
● username: &quot;string&quot;
● password: &quot;string&quot;
■ Method: POST
■ Response: { &quot;token&quot;: &quot;...&quot; }
● (Esse token será necessário na requisição das de todas as demais chamadas
a API)

● Após o login, obter a url do vídeo a ser transmitido:
○ fileName: bunny.mp4
○ x-access-token: Token recebido na Api acima
○ API para obter URL do Vídeo
■ Documentação da API: http://mobiletest.seventh.com.br/api-
docs/#/Videos/get_video__fileName_
■ Params:
● fileName: &quot;string&quot;
● x-access-token: &quot;string&quot;
■ Method: GET
■ Usar como parâmetro x-access-token o Token fornecido pela Api de Login.
■ Response: { &quot;url&quot;: &quot;responsecomaurldovideo.m3u8&quot; }

● Criar uma tela com um player de vídeo, reproduzindo o vídeo conforme a url da Api acima.
○ funções do player: play, pause, fullscreen;
○ URL do Stream de vídeo

■ (Essa é a url com o stream da câmera que o player deve transmitir, obtida através da
chamada da Api: /video/{fileName});

Sinta-se à vontade para usar as ferramentas e bibliotecas que você julgar adequadas e que podem agregar
valor à aplicação.
