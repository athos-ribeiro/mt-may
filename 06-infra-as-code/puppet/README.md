# Executando os exemplos

## Vagrantfile + Provisionamento com Puppet

Caso no seu `Vagrantfile` contenha as linhas a seguir, a execução do puppet
será feita durante o provisionamento da máquina pelo próprio vagrant. Ou seja,
após a execução do commando `$ vagrant up` a sua máquina já estará configurada
como descrito no seu manifesto puppet, basta acessá-la através do comando `$
vagrant ssh` e verificar o estado do sistema.

```
config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path = "manifests/modules"
end
```

## Provisionamento manual

Caso no seu `Vagrantfile` não esteja especificando o provisionamento automático
com puppet, você deve acessar a máquina e fazê-lo manulamente. Para configurar
e acessar a máquina virtual execute:

```
$ vagrant up 
$ vagrant ssh
```

Ao acessar a máquina virtual entre no diretório `/vagrant` e execute o seguinte
comando:

```
$ sudo puppet apply --modulepath=./modules/ default.pp
```

Após a sua execução o estado da sua máquina será o mesmo do descrito no seu
manifesto puppet.
