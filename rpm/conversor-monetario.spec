Name:           conversor-monetario
Version:        0.1
Release:        1
Summary:        Um conversor monetario

License:        GPLv3+
URL:            http://athoscr.me
Source0:        conversor-monetario-0.1.tar.gz

Requires: curl
Requires: jq

BuildArch: noarch
      
%description 
Um conversor monetario
feito com o pessoal do Itaú :)

%prep
%autosetup

%build

%install
mkdir -p %{buildroot}%{_bindir}
install -m 755 conversor-monetario %{buildroot}%{_bindir}

%files
%{_bindir}/conversor-monetario

%changelog
* Wed May 16 2018 Athos Ribeiro <athoscr@fedoraproject.org> 2.9-1
- Initial version of the package
- Package used to teach about RPMs
