<?php
$CONFIG = [
  // Don't create nextcloud default documents in a new file storage.
  'skeletondirectory' => '',

  // The image carries intentional patches to core files (see Dockerfile),
  // which would otherwise be reported by the code integrity check.
  'integrity.check.disabled' => true,
];
