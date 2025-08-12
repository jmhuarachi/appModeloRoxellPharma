import 'package:flutter/material.dart';
import 'package:flutter_application_1/costants/app_colors.dart'; // Solo este import es necesario

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  bool _twoFactorEnabled = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Configuración',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.gray800,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Ajustes Generales',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.gray700,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                _ProfileOption(
                  icon: Icons.store_rounded,
                  title: 'Configuración de Sucursal',
                  onTap: () {
                    // Acción para configuración de sucursal
                  },
                ),
                const Divider(height: 1, indent: 16),
                _ProfileOption(
                  icon: Icons.payment_rounded,
                  title: 'Métodos de Pago',
                  onTap: () {
                    // Acción para métodos de pago
                  },
                ),
                const Divider(height: 1, indent: 16),
                _ProfileOption(
                  icon: Icons.local_shipping_rounded,
                  title: 'Opciones de Envío',
                  onTap: () {
                    // Acción para opciones de envío
                  },
                ),
                const Divider(height: 1, indent: 16),
                _ProfileOption(
                  icon: Icons.receipt_long_rounded,
                  title: 'Plantillas de Factura',
                  onTap: () {
                    // Acción para plantillas de factura
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Preferencias',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.gray700,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                _SettingsSwitchOption(
                  icon: Icons.notifications_rounded,
                  title: 'Notificaciones',
                  value: _notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                  },
                ),
                const Divider(height: 1, indent: 16),
                _SettingsSwitchOption(
                  icon: Icons.dark_mode_rounded,
                  title: 'Modo Oscuro',
                  value: _darkModeEnabled,
                  onChanged: (value) {
                    setState(() {
                      _darkModeEnabled = value;
                    });
                  },
                ),
                const Divider(height: 1, indent: 16),
                _SettingsSwitchOption(
                  icon: Icons.security_rounded,
                  title: 'Autenticación en Dos Pasos',
                  value: _twoFactorEnabled,
                  onChanged: (value) {
                    setState(() {
                      _twoFactorEnabled = value;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Sistema',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.gray700,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                _ProfileOption(
                  icon: Icons.update_rounded,
                  title: 'Actualizaciones',
                  onTap: () {
                    // Acción para actualizaciones
                  },
                ),
                const Divider(height: 1, indent: 16),
                _ProfileOption(
                  icon: Icons.backup_rounded,
                  title: 'Copia de Seguridad',
                  onTap: () {
                    // Acción para copia de seguridad
                  },
                ),
                const Divider(height: 1, indent: 16),
                _ProfileOption(
                  icon: Icons.help_rounded,
                  title: 'Ayuda y Soporte',
                  onTap: () {
                    // Acción para ayuda y soporte
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget ProfileOption integrado
class _ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ProfileOption({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.gray100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: AppColors.gray600, size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.gray800,
                  ),
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.gray400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget Switch Option funcional
class _SettingsSwitchOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SettingsSwitchOption({
    required this.icon,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.gray100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppColors.gray600, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.gray800,
              ),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.orange600,
            activeTrackColor: AppColors.orange200,
            inactiveThumbColor: AppColors.gray400,
            inactiveTrackColor: AppColors.gray200,
          ),
        ],
      ),
    );
  }
}