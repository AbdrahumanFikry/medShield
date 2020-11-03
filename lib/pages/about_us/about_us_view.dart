import 'package:flutter/material.dart';
import 'package:med_shield_new_version/components/appDirectionality.dart';
import 'package:med_shield_new_version/components/plainAppBar.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/pages/about_us/viewModel.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';

class AboutUsView extends StatelessWidget {
  final List<ViewModel> data = [
    ViewModel(
      title: 'WHY CHOOSE US .',
      description:
          "Our private medical insurance products are used by a diverse range of businesses large and small as well as groups and associations, including district and county councils. We have a wide range of experience and can offer flexibility in your cover, ensuring that we help you find the best health care insurance scheme to suit your company.",
    ),
    ViewModel(
      title: 'OUR VISION .',
      description:
          "Lead the evolution of health care industry and enable members across nation to enjoy a better, dignified and healthier life.",
    ),
    ViewModel(
      title: 'OUR MISSION .',
      description:
          "Improving the health and well being of the national society by blending technology with experience and expertise, enabling access to a comprehensive, fully integrated network of the highest quality and most affordable care, delivered with integrity and respect.",
    ),
    ViewModel(
      title: 'OUR TEAM VALUES .',
      description:
          "by setting and surpassing higher standards, we will persist to establish a smarter, disciplined, and more efficient organization that delivers outstanding and exceptional care.",
    ),
    ViewModel(
      title: 'Quality .',
      description:
          "by setting and surpassing higher standards, we will persist to establish a smarter, disciplined, and more efficient organization that delivers outstanding and exceptional care.",
    ),
    ViewModel(
      title: 'Compassion .',
      description:
          "our belief of caring is unique in every personal interaction as we treat individuals, families and colleagues with sympathy, responsiveness and integrity.",
    ),
    ViewModel(
      title: 'Respect .',
      description:
          "we considerately treat each and every individual with care and consideration. We value the diverse perspectives of everybody .",
    ),
    ViewModel(
      title: 'Foresight .',
      description:
          "we anticipate daring challenges tomorrow may bring and develop new innovative ways to inspire healthier communities.",
    ),
    ViewModel(
      title: 'Collaboration .',
      description:
          " by teaming up to sharing knowledge and skills, and through constant communication with whom we serve and their families, we create a unified, integrated approach to care.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppDirectionality(
        child: Scaffold(
          appBar: PlainAppBar(
            barTitle: S.of(context).aboutUs,
            enableBack: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5.0,
              vertical: 10.0,
            ),
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      child: RichText(
                        text: TextSpan(
                          text: '',
                          children: [
                            TextSpan(
                              text: data[index].title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorUtil.primaryColor,
                              ),
                            ),
                            WidgetSpan(
                              child: Divider(
                                color: Colors.transparent,
                                thickness: 2.0,
                              ),
                            ),
                            TextSpan(
                              text: data[index].description,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: ColorUtil.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
