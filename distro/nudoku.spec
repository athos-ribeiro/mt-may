Name:           nudoku
Version:        0.2.5
Release:        5%{?dist}
Summary:        Ncurses based Sudoku game
License:        GPLv3
Group:          Amusements/Games
Url:            https://github.com/jubalh/%{name}
Source:         https://github.com/jubalh/%{name}/archive/%{version}.tar.gz#/%{name}-%{version}.tar.gz
BuildRequires:  autoconf
BuildRequires:  automake
BuildRequires:  ncurses-devel
BuildRequires:  xz

%description
nudoku is a ncurses based Sudoku game.

%prep
%autosetup -n %{name}-%{version} 

%build
autoreconf -fi
%configure
make %{?_smp_mflags}

%install
make DESTDIR=%{buildroot} install %{?_smp_mflags}

%files
%license LICENSE
%doc README.md
%{_bindir}/nudoku
%{_mandir}/man6/nudoku.6.*

%changelog
* Thu Feb 08 2018 Fedora Release Engineering <releng@fedoraproject.org> - 0.2.5-5
- Rebuilt for https://fedoraproject.org/wiki/Fedora_28_Mass_Rebuild

* Thu Aug 03 2017 Fedora Release Engineering <releng@fedoraproject.org> - 0.2.5-4
- Rebuilt for https://fedoraproject.org/wiki/Fedora_27_Binutils_Mass_Rebuild

* Thu Jul 27 2017 Fedora Release Engineering <releng@fedoraproject.org> - 0.2.5-3
- Rebuilt for https://fedoraproject.org/wiki/Fedora_27_Mass_Rebuild

* Sat Feb 11 2017 Fedora Release Engineering <releng@fedoraproject.org> - 0.2.5-2
- Rebuilt for https://fedoraproject.org/wiki/Fedora_26_Mass_Rebuild

* Wed Jun 08 2016 Fabio Alessandro Locati <fale@fedoraproject.org> - 0.2.5-1
- Update to version 0.2.5

* Tue Mar 29 2016 Fabio Alessandro Locati <fale@fedoraproject.org> - 0.2.4-2
- Fix license
- Fix description
- Fix Summary
- Fix group

* Mon Mar 07 2016 Fabio Alessandro Locati <fale@fedoraproject.org> - 0.2.4-1
- First Fedora Release
