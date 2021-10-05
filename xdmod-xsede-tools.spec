Name: xdmod-xsede-tools
Version: 1.0.0
Release: 1%{?dist}
BuildArch: noarch
Summary: Helper scripts and tools for data processing for the XSEDE version of XDMoD.
License: GPLv2+
URL: https://open.xdmod.org
Group: Applications/System
Source: %{name}-%{version}.tar.gz

%description
Configuration package that installs and configures PCP data collection at Ookami

%prep
%setup

%build
make

%install
make install BIN_DIR=$RPM_BUILD_ROOT%{_bindir} ETC_DIR=$RPM_BUILD_ROOT/%{_sysconfdir} SYSCONF_DIR=$RPM_BUILD_ROOT/%{_sysconfdir}/sysconfig SBIN_DIR=$RPM_BUILD_ROOT/%{_sbindir}

%files
%{_bindir}
%{_sysconfdir}
