ceph-repository:
  pkgrepo.managed:
    - humanname: Ceph Repository
    - key_url: {{ pillar['ceph']['repository']['key_url'] }}
    - name: {{ pillar['ceph']['repository']['name'] }}
    - require_in:
      - ceph-package

ceph-package:
  pkg.installed:
    - name: ceph
    - refresh: True