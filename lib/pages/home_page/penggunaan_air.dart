import 'package:flutter/material.dart';
import 'package:mobile_smart_dashboard/providers/device_provider.dart';
import 'package:mobile_smart_dashboard/shared/theme.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// class PenggunaanAir extends StatefulWidget {
//   const PenggunaanAir({super.key});

//   @override
//   State<PenggunaanAir> createState() => _PenggunaanAirState();
// }

// class _PenggunaanAirState extends State<PenggunaanAir> {
//   @override
//   Widget build(BuildContext context) {
//     DeviceProvider deviceProvider = Get.find<DeviceProvider>();

//     Widget listData() {
//       return DataTable(
//         columns: [
//           DataColumn(
//             label: Text(
//               'FORWARD FLOW',
//               style: AppText.textBase.copyWith(fontWeight: AppText.semiBold),
//             ),
//           ),
//           DataColumn(
//             label: Text(
//               'TIME STAMP',
//               style: AppText.textBase.copyWith(fontWeight: AppText.semiBold),
//             ),
//           ),
//           DataColumn(
//             label: Text(
//               'TIME',
//               style: AppText.textBase.copyWith(fontWeight: AppText.semiBold),
//             ),
//           ),
//         ],
//         rows: [
//           DataRow(cells: [
//             DataCell(Text(
//               '11.13 m',
//               style: AppText.textBase.copyWith(fontWeight: AppText.medium),
//             )),
//             DataCell(Text(
//               '2022-12-09 10:55:13',
//               style: AppText.textBase.copyWith(fontWeight: AppText.medium),
//               overflow: TextOverflow.ellipsis,
//             )),
//             DataCell(Container(
//               height: 32,
//               width: 70,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//                 color: AppColorDanger.normal,
//               ),
//               child: Center(
//                 child: Text(
//                   'Failed',
//                   style: AppText.textExtraSmall.copyWith(
//                       fontWeight: AppText.medium, color: AppColorPrimay.white),
//                 ),
//               ),
//             )),
//           ])
//         ],
//       );
//     }

//     Widget header() {
//       return AppBar(
//         backgroundColor: AppColorPrimay.background,
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         leading: GestureDetector(
//           onTap: () {
//             Get.back();
//           },
//           child: const Icon(
//             Icons.arrow_back_ios_new_rounded,
//             color: AppColorText.primary,
//             size: 18,
//           ),
//         ),
//         title: Text(
//           'Data Penggunaan Air Dialy',
//           style: AppText.textLarge.copyWith(
//               fontWeight: AppText.medium, color: AppColorText.primary),
//         ),
//       );
//     }

//     Widget data() {
//       return SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Column(
//           children: [
//             listData(),
//           ],
//         ),
//       );
//     }

//     return Scaffold(
//       backgroundColor: AppColorPrimay.background,
//       body: SingleChildScrollView(
//         child: SafeArea(
//             bottom: false,
//             child: Column(
//               children: [
//                 header(),
//                 data(),
//               ],
//             )),
//       ),
//     );
//   }
// }

class PenggunaanAir extends StatelessWidget {
  const PenggunaanAir({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorPrimay.background,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColorText.primary,
            size: 18,
          ),
        ),
        title: Text(
          'Data Penggunaan Air Daily',
          style: AppText.textLarge.copyWith(
              fontWeight: AppText.medium, color: AppColorText.primary),
        ),
      ),
      body: ChangeNotifierProvider<DeviceProvider>(
        create: (context) => DeviceProvider(),
        child: Consumer<DeviceProvider>(
          builder: (context, provider, child) {
            if (provider.device == null) {
              provider.getData(context);
              return const Center(child: CircularProgressIndicator());
            }
            // when we have the json loaded... let's put the data into a data table widget
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              // Data table widget in not scrollable so we have to wrap it in a scroll view when we have a large data set..
              child: SingleChildScrollView(
                child: DataTable(
                  columns: [
                    DataColumn(
                      label: Text(
                        'FORWARD FLOW',
                        style: AppText.textBase
                            .copyWith(fontWeight: AppText.semiBold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'TIME STAMP',
                        style: AppText.textBase
                            .copyWith(fontWeight: AppText.semiBold),
                      ),
                    ),
                  ],
                  rows: provider.device!.data!
                      .map((device) =>
                          // we return a DataRow every time
                          DataRow(
                              // List<DataCell> cells is required in every row
                              cells: [
                                DataCell(Text(
                                  '${device.forwardflow} m',
                                  style: AppText.textBase
                                      .copyWith(fontWeight: AppText.medium),
                                )),
                                DataCell(Text(
                                  '${device.waterdate}',
                                  style: AppText.textBase
                                      .copyWith(fontWeight: AppText.medium),
                                  overflow: TextOverflow.ellipsis,
                                )),
                              ]))
                      .toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
