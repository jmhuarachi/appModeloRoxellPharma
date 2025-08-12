import 'package:flutter/material.dart';
import 'package:flutter_application_1/costants/app_colors.dart';
import 'package:flutter_application_1/screens/admin/widgets/views/create_edit_order_screen.dart';
import 'package:intl/intl.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedStatus = 'all';
  String _selectedPaymentMethod = 'all';
  String _selectedDateRange = 'all';
  bool _showAdvancedFilters = false;
  final Map<int, bool> _expandedOrders = {};
  bool _isLoading = false;

  // Mock data - replace with your API calls
  final List<Map<String, dynamic>> _orders = [
    {
      "id": 1,
      "orderNumber": "PED-2025-001",
      "customer": {"name": "Farmacia Salud", "nit": "123456789"},
      "branch": "La Paz",
      "seller": "Juan Pérez",
      "orderDate": "2025-01-10",
      "deliveryDate": "2025-01-15",
      "deliveryTime": "14:00",
      "status": "Entregado",
      "paymentMethod": "Contado",
      "creditTerm": null,
      "deliveryAddress": "Av. Arce #1234, Zona Sopocachi",
      "totalAmount": 345.50,
      "customerNotes": "Entregar en recepción",
      "products": [
        {
          "name": "AMBROXOL",
          "composition": "Ambroxol Clorhidrato 30 mg",
          "quantity": 5,
          "unitPrice": 22.50,
          "subtotal": 112.50
        },
        {
          "name": "AMOXICILINA",
          "composition": "Amoxicilina 250 mg",
          "quantity": 10,
          "unitPrice": 15.00,
          "subtotal": 150.00
        },
        {
          "name": "GASTROXELL",
          "composition": "Omeprazol 20 mg",
          "quantity": 20,
          "unitPrice": 1.80,
          "subtotal": 36.00
        },
        {
          "name": "DOLO-XELL",
          "composition": "Salicilato de Metilo-Alcanfor-Mentol",
          "quantity": 3,
          "unitPrice": 12.50,
          "subtotal": 37.50
        }
      ],
      "can": {"edit": true, "delete": false, "changeStatus": false}
    },
    {
      "id": 2,
      "orderNumber": "PED-2025-002",
      "customer": {"name": "Clínica San Juan", "nit": "987654321"},
      "branch": "Cochabamba",
      "seller": "María Gómez",
      "orderDate": "2025-01-12",
      "deliveryDate": "2025-01-18",
      "deliveryTime": "10:30",
      "status": "Procesando",
      "paymentMethod": "Crédito",
      "creditTerm": 30,
      "deliveryAddress": "Calle Jordán #567, Zona Recoleta",
      "totalAmount": 1280.00,
      "customerNotes": "Facturar con NIT 987654321",
      "products": [
        {
          "name": "AZITROXELL",
          "composition": "Azitromicina 500 mg",
          "quantity": 10,
          "unitPrice": 85.00,
          "subtotal": 850.00
        },
        {
          "name": "KETEROX",
          "composition": "Ketorolaco 20 mg",
          "quantity": 100,
          "unitPrice": 0.75,
          "subtotal": 75.00
        },
        {
          "name": "TRIMESOL FORTE",
          "composition": "Cotrimoxazol 800mg + 160mg",
          "quantity": 200,
          "unitPrice": 0.50,
          "subtotal": 100.00
        },
        {
          "name": "NITROFURAZONA",
          "composition": "Nitrofurazona 0.2 g",
          "quantity": 5,
          "unitPrice": 18.00,
          "subtotal": 90.00
        },
        {
          "name": "POVIDONA YODADA",
          "composition": "Povidona Yodada 10%",
          "quantity": 5,
          "unitPrice": 25.00,
          "subtotal": 125.00
        }
      ],
      "can": {"edit": true, "delete": true, "changeStatus": true}
    },
    {
      "id": 3,
      "orderNumber": "PED-2025-003",
      "customer": {"name": "Farmacia del Pueblo", "nit": "456789123"},
      "branch": "Santa Cruz",
      "seller": "Carlos Rojas",
      "orderDate": "2025-01-15",
      "deliveryDate": "2025-01-20",
      "deliveryTime": "16:00",
      "status": "Pendiente",
      "paymentMethod": "Contado",
      "creditTerm": null,
      "deliveryAddress": "Av. San Martín #789, Zona Equipetrol",
      "totalAmount": 420.25,
      "customerNotes": "Entregar antes de las 17:00",
      "products": [
        {
          "name": "LORALGEX",
          "composition": "Desloratadina 2.5mg/5ml",
          "quantity": 5,
          "unitPrice": 45.00,
          "subtotal": 225.00
        },
        {
          "name": "NORMOGLIN",
          "composition": "Metformina 850 mg",
          "quantity": 50,
          "unitPrice": 1.20,
          "subtotal": 60.00
        },
        {
          "name": "PROFEROX 200",
          "composition": "Ketoprofeno 200 mg",
          "quantity": 100,
          "unitPrice": 0.80,
          "subtotal": 80.00
        },
        {
          "name": "COTRIXELL FORTE",
          "composition": "Cotrimoxazol 400/80/5ml",
          "quantity": 5,
          "unitPrice": 25.00,
          "subtotal": 125.00
        }
      ],
      "can": {"edit": true, "delete": true, "changeStatus": true}
    },
    {
      "id": 4,
      "orderNumber": "PED-2025-004",
      "customer": {"name": "Hospital Municipal", "nit": "321654987"},
      "branch": "La Paz",
      "seller": "Ana Mendoza",
      "orderDate": "2025-01-18",
      "deliveryDate": "2025-01-22",
      "deliveryTime": "11:00",
      "status": "Cancelado",
      "paymentMethod": "Crédito",
      "creditTerm": 60,
      "deliveryAddress": "Calle Landaeta #234, Zona San Pedro",
      "totalAmount": 1750.80,
      "customerNotes": "Requieren factura con detalles de cada producto",
      "products": [
        {
          "name": "AMOXICILINA 1g",
          "composition": "Amoxicilina 1g",
          "quantity": 500,
          "unitPrice": 0.60,
          "subtotal": 300.00
        },
        {
          "name": "KETEROX",
          "composition": "Ketorolaco 20 mg",
          "quantity": 300,
          "unitPrice": 0.75,
          "subtotal": 225.00
        },
        {
          "name": "GASTROXELL",
          "composition": "Omeprazol 20 mg",
          "quantity": 500,
          "unitPrice": 1.80,
          "subtotal": 900.00
        },
        {
          "name": "DEXTROFAR",
          "composition": "Dextrometorfano 10 mg/5 ml",
          "quantity": 10,
          "unitPrice": 32.50,
          "subtotal": 325.00
        }
      ],
      "can": {"edit": false, "delete": false, "changeStatus": false}
    },
    {
      "id": 5,
      "orderNumber": "PED-2025-005",
      "customer": {"name": "Farmacia Económica", "nit": "789123456"},
      "branch": "Cochabamba",
      "seller": "Luis Fernández",
      "orderDate": "2025-01-20",
      "deliveryDate": "2025-01-25",
      "deliveryTime": "15:30",
      "status": "En Ruta",
      "paymentMethod": "Contado",
      "creditTerm": null,
      "deliveryAddress": "Av. América #345, Zona Queru Queru",
      "totalAmount": 680.00,
      "customerNotes": "Llamar 30 minutos antes de llegar",
      "products": [
        {
          "name": "CLOTRIMAZOL CV",
          "composition": "Clotrimazol 1%",
          "quantity": 20,
          "unitPrice": 18.00,
          "subtotal": 360.00
        },
        {
          "name": "MITIZOL",
          "composition": "Trinidazol 1g",
          "quantity": 10,
          "unitPrice": 32.00,
          "subtotal": 320.00
        }
      ],
      "can": {"edit": true, "delete": false, "changeStatus": true}
    }
  ];

  final List<Map<String, String>> _statusOptions = [
    {'value': 'all', 'label': 'Todos'},
    {'value': 'Pendiente', 'label': 'Pendiente'},
    {'value': 'Procesando', 'label': 'Procesando'},
    {'value': 'Enviado', 'label': 'Enviado'},
    {'value': 'Entregado', 'label': 'Entregado'},
    {'value': 'Cancelado', 'label': 'Cancelado'},
  ];

  final List<Map<String, String>> _paymentMethodOptions = [
    {'value': 'all', 'label': 'Todos'},
    {'value': 'Contado', 'label': 'Contado'},
    {'value': 'Crédito', 'label': 'Crédito'},
    {'value': 'Mixto', 'label': 'Mixto'},
  ];

  final List<Map<String, String>> _dateRangeOptions = [
    {'value': 'all', 'label': 'Todos'},
    {'value': 'today', 'label': 'Hoy'},
    {'value': 'week', 'label': 'Esta semana'},
    {'value': 'month', 'label': 'Este mes'},
    {'value': 'custom', 'label': 'Personalizado'},
  ];

  @override
  Widget build(BuildContext context) {
    final filteredOrders = _orders.where((order) {
      final matchesSearch =
          order['orderNumber'].toString().toLowerCase().contains(
            _searchController.text.toLowerCase(),
          ) ||
          order['customer']['name'].toString().toLowerCase().contains(
            _searchController.text.toLowerCase(),
          ) ||
          order['customer']['nit'].toString().toLowerCase().contains(
            _searchController.text.toLowerCase(),
          );

      final matchesStatus =
          _selectedStatus == 'all' || order['status'] == _selectedStatus;

      final matchesPaymentMethod =
          _selectedPaymentMethod == 'all' ||
          order['paymentMethod'] == _selectedPaymentMethod;

      // Date range filtering would be implemented here
      final matchesDateRange = true; // Simplified for this example

      return matchesSearch &&
          matchesStatus &&
          matchesPaymentMethod &&
          matchesDateRange;
    }).toList();

    // Calculate statistics
    final pendingCount = _orders
        .where((o) => o['status'] == 'Pendiente')
        .length;
    final processingCount = _orders
        .where((o) => o['status'] == 'Procesando')
        .length;
    final deliveredCount = _orders
        .where((o) => o['status'] == 'Entregado')
        .length;
    final canceledCount = _orders
        .where((o) => o['status'] == 'Cancelado')
        .length;
    final totalAmount = _orders.fold(
      0.0,
      (sum, order) => sum + order['totalAmount'],
    );

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Gestión de Pedidos'),
      //   backgroundColor: AppColors.orange600,
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Statistics Cards
            // _buildStatisticsCards(
            //   pendingCount,
            //   processingCount,
            //   deliveredCount,
            //   canceledCount,
            //   totalAmount,
            // ),
            const SizedBox(height: 20),

            // Search and Filters
            _buildSearchAndFilters(),
            const SizedBox(height: 16),

            // Advanced Filters
            if (_showAdvancedFilters) _buildAdvancedFilters(),

            // Orders List
            _buildOrdersList(filteredOrders),
          ],
        ),
      ),
      // Accion para crear nuevo pedido
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateEditOrderScreen(),
            ),
          );
        },
        backgroundColor: AppColors.orange600,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  // Widget _buildStatisticsCards(
  //   int pendingCount,
  //   int processingCount,
  //   int deliveredCount,
  //   int canceledCount,
  //   double totalAmount,
  // ) {
  //   return Row(
  //     children: [
  //       Expanded(
  //         child: StatCard(
  //           title: 'Total Pedidos',
  //           value: _orders.length.toString(),
  //           icon: Icons.shopping_bag_rounded,
  //           color: AppColors.blue500,
  //         ),
  //       ),
  //       const SizedBox(width: 12),
  //       Expanded(
  //         child: StatCard(
  //           title: 'Valor Total',
  //           value: '\$${totalAmount.toStringAsFixed(2)}',
  //           icon: Icons.attach_money_rounded,
  //           color: AppColors.green600,
  //         ),
  //       ),
  //       const SizedBox(width: 12),
  //       Expanded(
  //         child: StatCard(
  //           title: 'Pendientes',
  //           value: pendingCount.toString(),
  //           icon: Icons.pending_rounded,
  //           color: AppColors.yellow600,
  //         ),
  //       ),
  //       const SizedBox(width: 12),
  //       Expanded(
  //         child: StatCard(
  //           title: 'Cancelados',
  //           value: canceledCount.toString(),
  //           icon: Icons.cancel_rounded,
  //           color: AppColors.red600,
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildSearchAndFilters() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Buscar por número de pedido, cliente o NIT...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: (value) {
              setState(() {});
            },
          ),
        ),
        const SizedBox(width: 12),
        IconButton(
          onPressed: () {
            setState(() {
              _showAdvancedFilters = !_showAdvancedFilters;
            });
          },
          icon: const Icon(Icons.filter_alt_rounded),
          style: IconButton.styleFrom(
            backgroundColor: AppColors.gray200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: () {
            setState(() {
              _searchController.clear();
              _selectedStatus = 'all';
              _selectedPaymentMethod = 'all';
              _selectedDateRange = 'all';
            });
          },
          icon: const Icon(Icons.refresh),
          style: IconButton.styleFrom(
            backgroundColor: AppColors.red600,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAdvancedFilters() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.gray100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Status Filter
          DropdownButtonFormField<String>(
            value: _selectedStatus,
            decoration: InputDecoration(
              labelText: 'Estado del Pedido',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            items: _statusOptions.map((status) {
              return DropdownMenuItem<String>(
                value: status['value'],
                child: Text(status['label']!),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedStatus = value!;
              });
            },
          ),
          const SizedBox(height: 16),

          // Payment Method Filter
          DropdownButtonFormField<String>(
            value: _selectedPaymentMethod,
            decoration: InputDecoration(
              labelText: 'Método de Pago',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            items: _paymentMethodOptions.map((method) {
              return DropdownMenuItem<String>(
                value: method['value'],
                child: Text(method['label']!),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedPaymentMethod = value!;
              });
            },
          ),
          const SizedBox(height: 16),

          // Date Range Filter
          DropdownButtonFormField<String>(
            value: _selectedDateRange,
            decoration: InputDecoration(
              labelText: 'Rango de Fechas',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            items: _dateRangeOptions.map((range) {
              return DropdownMenuItem<String>(
                value: range['value'],
                child: Text(range['label']!),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedDateRange = value!;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersList(List<Map<String, dynamic>> orders) {
    if (orders.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            'No se encontraron pedidos que coincidan con los criterios de búsqueda',
            style: TextStyle(color: AppColors.gray500, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        final isExpanded = _expandedOrders[order['id']] ?? false;

        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Order Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order['orderNumber'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${order['customer']['name']} (NIT: ${order['customer']['nit']})',
                            style: TextStyle(
                              color: AppColors.gray500,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.store,
                                size: 16,
                                color: AppColors.gray400,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                order['branch'],
                                style: TextStyle(
                                  color: AppColors.gray500,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Order Info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\Bs${order['totalAmount'].toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            // Status Chip
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: _getStatusColor(
                                  order['status'],
                                ).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    _getStatusIcon(order['status']),
                                    size: 14,
                                    color: _getStatusColor(order['status']),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    order['status'],
                                    style: TextStyle(
                                      color: _getStatusColor(order['status']),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            // Payment Method Chip
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: _getPaymentMethodColor(
                                  order['paymentMethod'],
                                ).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    _getPaymentMethodIcon(
                                      order['paymentMethod'],
                                    ),
                                    size: 14,
                                    color: _getPaymentMethodColor(
                                      order['paymentMethod'],
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    order['paymentMethod'],
                                    style: TextStyle(
                                      color: _getPaymentMethodColor(
                                        order['paymentMethod'],
                                      ),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  if (order['paymentMethod'] == 'Crédito' &&
                                      order['creditTerm'] != null)
                                    Text(
                                      ' (${order['creditTerm']}d)',
                                      style: TextStyle(
                                        color: _getPaymentMethodColor(
                                          order['paymentMethod'],
                                        ),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () => _toggleOrderDetails(order['id']),
                      icon: Icon(
                        isExpanded ? Icons.expand_less : Icons.expand_more,
                      ),
                      color: AppColors.blue600,
                    ),
                    IconButton(
                      onPressed: () {
                        // Generate PDF
                        _generateOrderPDF(order);
                      },
                      icon: const Icon(Icons.picture_as_pdf),
                      color: AppColors.blue600,
                    ),
                    if (order['can']['edit'])
                      IconButton(
                        onPressed: () {
                          // Edit order
                          _editOrder(order);
                        },
                        icon: const Icon(Icons.edit),
                        color: AppColors.blue600,
                      ),
                    if (order['can']['changeStatus'])
                      IconButton(
                        onPressed: () {
                          // Change status
                          _changeOrderStatus(order);
                        },
                        icon: const Icon(Icons.swap_vert),
                        color: AppColors.green600,
                      ),
                    if (order['can']['delete'])
                      IconButton(
                        onPressed: () {
                          // Delete order
                          _deleteOrder(order);
                        },
                        icon: const Icon(Icons.delete),
                        color: AppColors.red600,
                      ),
                  ],
                ),

                // Order Details
                if (isExpanded) ...[
                  const Divider(),
                  const SizedBox(height: 8),

                  // Order Information
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 3,
                    children: [
                      _buildDetailItem(
                        'Fecha Pedido',
                        DateFormat(
                          'dd/MM/yyyy',
                        ).format(DateTime.parse(order['orderDate'])),
                        icon: Icons.calendar_today,
                      ),
                      _buildDetailItem(
                        'Fecha Entrega',
                        '${DateFormat('dd/MM/yyyy').format(DateTime.parse(order['deliveryDate']))} ${order['deliveryTime']}',
                        icon: Icons.calendar_today,
                      ),
                      _buildDetailItem(
                        'Dirección Entrega',
                        order['deliveryAddress'],
                        icon: Icons.location_on,
                      ),
                      _buildDetailItem(
                        'Vendedor',
                        order['seller'] ?? 'No asignado',
                        icon: Icons.person,
                      ),
                      _buildDetailItem(
                        'Notas',
                        order['customerNotes'] ?? 'Ninguna',
                        icon: Icons.notes,
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Products List
                  const Text(
                    'Productos',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),

                  Table(
                    border: TableBorder.all(
                      color: AppColors.gray200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    children: [
                      // Header
                      const TableRow(
                        decoration: BoxDecoration(
                          color: AppColors.gray100,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Producto',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Cantidad',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Precio Unitario',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Subtotal',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      // Products
                      ...order['products'].map<TableRow>((product) {
                        return TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${product['name']}\n${product['composition']}',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                product['quantity'].toString(),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '\Bs${product['unitPrice'].toStringAsFixed(2)}',
                                textAlign: TextAlign.right,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '\Bs${product['subtotal'].toStringAsFixed(2)}',
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                      // Footer
                      TableRow(
                        decoration: const BoxDecoration(
                          color: AppColors.gray100,
                        ),
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Subtotal',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(''),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(''),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '\Bs${order['totalAmount'].toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDetailItem(String title, String value, {IconData? icon}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 16, color: AppColors.gray500),
          const SizedBox(width: 8),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: AppColors.gray500, fontSize: 12),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: true,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Pendiente':
        return AppColors.yellow600;
      case 'Procesando':
        return AppColors.blue600;
      case 'Enviado':
        return AppColors.indigo600;
      case 'Entregado':
        return AppColors.green600;
      case 'Cancelado':
        return AppColors.red600;
      default:
        return AppColors.gray600;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'Pendiente':
        return Icons.pending_rounded;
      case 'Procesando':
        return Icons.settings;
      case 'Enviado':
        return Icons.local_shipping_rounded;
      case 'Entregado':
        return Icons.check_circle_rounded;
      case 'Cancelado':
        return Icons.cancel_rounded;
      default:
        return Icons.help_rounded;
    }
  }

  Color _getPaymentMethodColor(String method) {
    switch (method) {
      case 'Contado':
        return AppColors.green600;
      case 'Crédito':
        return AppColors.purple600;
      case 'Mixto':
        return AppColors.teal600;
      default:
        return AppColors.gray600;
    }
  }

  IconData _getPaymentMethodIcon(String method) {
    switch (method) {
      case 'Contado':
        return Icons.attach_money_rounded;
      case 'Crédito':
        return Icons.credit_card_rounded;
      case 'Mixto':
        return Icons.account_balance_wallet_rounded;
      default:
        return Icons.payment_rounded;
    }
  }

  void _toggleOrderDetails(int orderId) {
    setState(() {
      _expandedOrders[orderId] = !(_expandedOrders[orderId] ?? false);
    });
  }

  void _generateOrderPDF(Map<String, dynamic> order) {
    // Implement PDF generation logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Generando PDF para ${order['orderNumber']}')),
    );
  }

  void _editOrder(Map<String, dynamic> order) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateEditOrderScreen(order: order),
      ),
    );
  }

  void _changeOrderStatus(Map<String, dynamic> order) {
    showDialog(
      context: context,
      builder: (context) {
        String? newStatus = order['status'];
        String? reason;

        return AlertDialog(
          title: const Text('Cambiar Estado del Pedido'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Seleccione el nuevo estado:'),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: newStatus,
                items: _statusOptions
                    .where((status) => status['value'] != 'all')
                    .map((status) {
                      return DropdownMenuItem<String>(
                        value: status['value'],
                        child: Text(status['label']!),
                      );
                    })
                    .toList(),
                onChanged: (value) {
                  newStatus = value;
                },
              ),
              if (newStatus == 'Cancelado') ...[
                const SizedBox(height: 16),
                const Text('Razón de cancelación:'),
                const SizedBox(height: 8),
                TextField(
                  onChanged: (value) => reason = value,
                  decoration: const InputDecoration(
                    hintText: 'Ingrese la razón de cancelación',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement status change logic
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Estado cambiado a $newStatus')),
                );
                Navigator.pop(context);
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }

  void _deleteOrder(Map<String, dynamic> order) {
    showDialog(
      context: context,
      builder: (context) {
        String? reason;

        return AlertDialog(
          title: const Text('Confirmar Eliminación'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '¿Está seguro de eliminar el pedido ${order['orderNumber']}?',
              ),
              const SizedBox(height: 16),
              const Text('Esta acción no se puede deshacer.'),
              const SizedBox(height: 16),
              const Text('Razón de eliminación:'),
              const SizedBox(height: 8),
              TextField(
                onChanged: (value) => reason = value,
                decoration: const InputDecoration(
                  hintText: 'Ingrese la razón de eliminación',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement delete logic
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Pedido ${order['orderNumber']} eliminado'),
                  ),
                );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.red600,
              ),
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }
}
