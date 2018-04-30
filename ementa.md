# Sugestões para a ementa

## Pré-requisitos para esta parte do curso:
    
  - Os alunos devem possuir código (funcionando) em estrutura de microservices com testes automatizados (para o CI).
  - Os microservices desenvolvidos pelos alunos devem possuir APIs bem definidas e documentadas.
  - As aplicações desenvolvidas pelos alunos (microservices) devem gerar arquivos de log a serem utilizados no módulo VIII.
  - Os aluno devem saber o básico de linha de comando (bash), shell script e git.
  - Os alunos deve entender como realizar conexões remotas via ssh


## Módulo VI - Distribuição de Software

- Segunda
  - Breve revisão de shell e shell script
  - A importância do controle de versão para trabalhos em equipe
  - Controle de versão distribuído
    - O que é?
    - Diferença entre distribuído e centralizado
  - Git workflow
    - branches
    - tags
    - merges
    - rebases
    - conflitos
  - Comandos importantes
    - status, diff, commit, pull, push, merge, rebase, checkout, tag, branch, remote, init, show, log
    - cherry-picks*, grep*, bisect*
  - Boas práticas de git
    - Como escrever boas mensagens
    - Quando fazer merge vs rebase
    - (push -f)?
    - nomeando minhas branches*
  - Gitlab
    - git VS git{lab,hub,bucket} (e outros)
    - issues
    - Merge Requests
    - Repositórios públicos e privados
    - namespaces (forks, grupos, etc)
    - milestones
    
- Terça
  - Introdução a distribuição de software

    - tarball

    - binários

    - binários + configuração = pacote

    - bundles

    - containers

  - Vantages e desvantagens das abordagens de distribuição de código fonte
  - Pacotes de softwares e gerenciadores

      - yum

    - dnf

    - apt

    - outros

    - Repositórios RPM

    - Quem distribui o software que roda no meu computador?

    - EPEL, RPMFusion, etc


- Quarta

    - RPM

    - Definição

    - Diferenças entre RPM e dnf/yum - dpkg e apt

    - Repositórios RPM

  - Empacotamento RPM
  - rpmbuild
  - Empacotamento em ambientes isolados

      - chroot

      - mock, sbuild, etc

    - Distribuição de pacotes

    - repositórios

    - COPR, OBS


## Módulo VII - Containers

- Quinta
  - Isolamento de processos
  - Máquinas virtuais
  - Virtualização

      - kvm

    - libvirt

    - Virtualbox

    - Vagrant

  - Containers 
  - Docker

      - Docker Hub

      - Dockerfiles

      - Deploy em containers

      - Comunicação entre containers

      - Montando volumes

      - Docker-compose

  - Outras tecnologias de containers
  - Kubernetes
  - Openshift

- Sexta
  - Imersão Cubo
  - Agile e DevOps em StartUps

## Módulo VIII - Integração e Entrega Contínua

- Segunda
  - Breve introdução a métodos ágeis
  - O que é integração contínua?
  - Entrega contínua
  - Introdução DevOps
  - Ferramentas de integração contínua
  - Testes, Análise estática e SecDevOps
  - Mergulhando no Jenkins (subir Jenkins com shell script)

- Terça
  - A importância da infraestrutura como código
    - REPLICABILIDADE (vários ambientes = testes, homologação, produção), vários servidores
    - vantagens
    - microservices
  - Ferramentas de Automação e gestão de configuração (salt, puppet, ansible, chef) e suas diferenças
  - Mergulhando em Puppet
  - Subindo uma instância de Jenkins com puppet

- Quarta
  - Laboratório: Puppet + Gitlab + Jenkins = Entrega contínua
  - Gitlab CI
  - Travis CI

- Quinta
  - Estruturação de log
  - Telemetria
  - Logs e formatos de log
  - Centralização de logs
  - rsyslog
  - Graylog

- Sexta
  - Imersão em segurança de aplicativos e webapps em nuvem
  - sessão flexível
  
# Links para montagem de apostilas:

- shell e shell scripting
  - http://tldp.org/LDP/Bash-Beginners-Guide/html/
- git
  - https://git-scm.com/book/en/v2
- gitlab
  - https://docs.gitlab.com/ee/user/index.html
- RPM
  - http://ftp.rpm.org/max-rpm/
  - https://fedoraproject.org/wiki/Packaging:Guidelines?rd=Packaging/Guidelines
- Docker
  - https://docs.docker.com/
- Métodos ágeis
  - Extreme Programming Explained: Embrace Change - Kent Beck
- DevOps e Infraestrutura como código
  - Site Reliability Engineering: How Google Runs Production Systems (livro)
- Jenkins
  - https://jenkins.io/doc/
- Puppet
  - https://puppet.com/docs/puppet/5.0/index.html
- Logs
  - https://docs.microsoft.com/pt-br/azure/architecture/microservices/logging-monitoring
  - https://cloud.spring.io/spring-cloud-sleuth/
