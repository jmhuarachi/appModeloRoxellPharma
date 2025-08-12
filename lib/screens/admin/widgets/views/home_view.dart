import 'package:flutter/material.dart';
import 'package:flutter_application_1/costants/app_colors.dart';
import 'package:flutter_application_1/screens/admin/widgets/activity_card.dart';
import 'package:flutter_application_1/screens/admin/widgets/stat_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header con título y botón de filtro
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Resumen General',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.gray800,
                ),
              ),
              IconButton(
                onPressed: () {
                  // Mostrar opciones de filtrado
                },
                icon: const Icon(Icons.filter_alt_rounded),
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.gray200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Tarjetas de estadísticas principales
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: [
              StatCard(
                title: 'Ventas Totales',
                value: 'Bs 12,540',
                icon: Icons.trending_up_rounded,
                color: AppColors.orange600,
                percentage: '+12%',
              ),
              StatCard(
                title: 'Pedidos Activos',
                value: '24',
                icon: Icons.shopping_bag_rounded,
                color: AppColors.blue600,
                percentage: '+8%',
              ),
              StatCard(
                title: 'Stock Crítico',
                value: '15',
                icon: Icons.warning_rounded,
                color: AppColors.red600,
              ),
              StatCard(
                title: 'Clientes Nuevos',
                value: '8',
                icon: Icons.people_rounded,
                color: AppColors.green600,
                percentage: '+15%',
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Gráficos o información adicional
          // Card(
          //   elevation: 0,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(16),
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.all(16),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         const Text(
          //           'Ventas por Sucursal',
          //           style: TextStyle(
          //             fontWeight: FontWeight.w600,
          //             fontSize: 16,
          //             color: AppColors.gray800,
          //           ),
          //         ),
          //         const SizedBox(height: 16),
          //         Container(
          //           height: 200,
          //           decoration: BoxDecoration(
          //             color: AppColors.gray100,
          //             borderRadius: BorderRadius.circular(12),
          //           ),
          //           child: const Center(
          //             child: Text(
          //               'Gráfico de ventas por sucursal',
          //               style: TextStyle(color: AppColors.gray500),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          const SizedBox(height: 24),

          // Sección de actividad reciente
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Actividad Reciente',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.gray800,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navegar a ver toda la actividad
                },
                child: const Text(
                  'Ver todo',
                  style: TextStyle(color: AppColors.blue600),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...List.generate(
            4,
            (index) => ActivityCard(
              title: index % 2 == 0 
                  ? 'Nuevo pedido #${1000 + index}' 
                  : 'Actualización de inventario',
              subtitle: index % 2 == 0
                  ? 'Cliente: María García'
                  : 'Producto: AMOXICILINA',
              time: '${5 + index} min ago',
              icon: index % 2 == 0 
                  ? Icons.shopping_bag_rounded 
                  : Icons.inventory_rounded,
            ),
          ),
          const SizedBox(height: 16),

          // Sección de productos con stock bajo
          const Text(
            'Productos con Stock Bajo',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.gray800,
            ),
          ),
          const SizedBox(height: 12),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildLowStockItem('AMBROXOL', '15/20', AppColors.red600),
                  const Divider(height: 24),
                  _buildLowStockItem('DOLO-XELL', '18/25', AppColors.yellow600),
                  const Divider(height: 24),
                  _buildLowStockItem('NITROFURAZONA', '22/30', AppColors.yellow600),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLowStockItem(String productName, String stock, Color color) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            productName,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        Text(
          stock,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}