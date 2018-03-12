# README

Framework: Rails 5.1.4

Padrão nas respostas: JSONAPI, para mais informações jsonapi.org.

Arquitetura: Além do bem conhecido MVC, utilizei a estrutura de Entities, Repositories e Services para realizar comunicação com serviço externo. Essa estrutura segue a linha do BDD, ao tentar definir bem as camadas de acordo com seu comportamento. A camada de Entity se comporta como um Modelo de uma entidade externa, já a camada Service realize de fato a comunicação com o serviço externo e a camada Repository fica entre a Service e a Entity gerenciando a comunicação entre o nosso serviço e o serviço externo.

Documentação das rotas: https://app.swaggerhub.com/apis/Hugosirq/BikeParaVc/1.0.0

Linters: Rubocop, Rails Best Practices, Brakeman, Simplecov.

Resolvi por deixar o CRUD completo exposto para que a equipe do mobile possa de fato gerenciar toda a estrutura do dado, não foi implementado nenhum tipo de autenticação visto que isso não era uma preocupação imediata nos requisitos.

