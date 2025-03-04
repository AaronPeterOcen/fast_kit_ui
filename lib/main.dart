import 'dart:developer';

// import 'package:example/pages/content_builder.dart';
// import 'package:example/pages/table_page.dart';
import 'package:fast_ui_kit/fast_ui_kit.dart';
import 'package:fast_ui_kit/ui/widgets/carousel.dart';
import 'package:fast_ui_kit/ui/widgets/search_select.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final theme = FastTheme(seed: Colors.green);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: theme.dark,
      theme: theme.light,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FastSearchAppBar(title: "Fast UI Kit", onSearch: (v) {}),
      body: FastContent(
        children: [
          _buildAnimatedIcons(),
          _buildCarousel(),
          _buildFormFields(),
          _buildButtons(),
          _buildTextStyles(),
          _buildLinks(),
          _buildSearchSelect(),
          _buildDropdown(),
          _buildButtonGroups(),
          _buildCalendar(),
          _buildAudioPlayers(),
          _buildDialogButton(),
        ],
      ),
    );
  }

  Widget _buildAnimatedIcons() {
    return FastAnimate(
      type: FastAnimateType.fadeInDownBig,
      child: FastRow(
        children: [
          Icon(FastIcons.maki.airport, size: 40),
          Icon(FastIcons.ant.CodeSandbox, size: 40),
          Icon(FastIcons.awesome.facebook_square, size: 40),
          Icon(FastIcons.elico.chrome, size: 40),
        ],
      ),
    );
  }

  Widget _buildCarousel() {
    return FastCarousel(
      itemCount: 30,
      height: 200,
      fraction: .4,
      scale: .7,
      itemBuilder: (c, i) {
        return FastImg(path: 'https://picsum.photos/200/300?random=$i');
      },
    );
  }

  Widget _buildFormFields() {
    return FastColumn(
      xGap: 10,
      yGap: 10,
      children: [
        FastFormFieldFile(
          initialValue: FastFileInitialData.network(
            'https://gestor.fastzap.chat/assets/logo-fastzapplus.png',
          ),
        ),
        FastFormFieldFile(
          showFileType: ShowFileType.bigIcon,
          initialValue: FastFileInitialData.network(
            'https://gestor.fastzap.chat/assets/logo-fastzapplus.png',
          ),
        ),
        const FastFormFieldFile(
          showFileType: ShowFileType.bigIconOrPreviewWhenImage,
          accepts: ['pdf'],
        ),
        FastFormFieldFile(
          showFileType: ShowFileType.iconAndName,
          initialValue: FastFileInitialData.network(
            'https://gestor.fastzap.chat/assets/logo-fastzapplus.png',
          ),
        ),
        FastFormField(
          minLines: 1,
          label: "CPF",
          validator: Mask.validations.cpf,
          mask: [Mask.cpf()],
        ),
        FastFormField(label: "Value", mask: [Mask.money()]),
      ],
    );
  }

  Widget _buildButtons() {
    return FastColumn(
      xGap: 10,
      yGap: 10,
      children: [
        FastButtonIcon(
          icon: FastIcons.modernPictograms.pencil,
          variant: ButtonVariant.outlined,
          loading: false,
          onPressed: () {
            context.showMessage(
              'Algo foi alterado com sucesso',
              title: 'Sucesso',
              type: MessageVariant.success,
              position: MessagePosition.top,
              style: Style.flat,
            );
          },
        ),
        FastButton(
          label: 'Confirmar',
          loading: true,
          variant: ButtonVariant.outlined,
          onPressed: () {
            context.showMessage(
              'Algo deu errado',
              title: 'Erro',
              position: MessagePosition.bottom,
              type: MessageVariant.error,
              style: Style.raised,
            );
          },
        ),
        const Row(
          children: [
            SizedBox(width: 50, child: FastSkeleton(radius: 100)),
            SizedBox(width: 10),
            Expanded(child: FastSkeleton()),
          ],
        ),
        const FastRow(
          children: [
            FastImg(path: 'https://github.com/welitonsousa.png', width: 60),
            FastAvatar(path: 'https://github.com/welitonsousa.png'),
          ],
        ),
        FastButton(
          label: 'go to list builder',
          onPressed: () {
            // context.push(const PageContent());
          },
        ),
        const FastButton(
          label: 'File Picker',
          onPressed: FastPickerService.picker,
        ),
        FastButton(
          label: 'table page',
          onPressed: () {
            // context.push(const TablePage());
          },
        ),
      ],
    );
  }

  Widget _buildTextStyles() {
    return FastColumn(
      xGap: 10,
      yGap: 10,
      children: [
        FastAnimate(
          type: FastAnimateType.fadeInLeftBig,
          duration: const Duration(seconds: 1),
          child: Text('Text H1', style: context.H1),
        ),
        Text('Text H2', style: context.H2),
        Text('Text H3', style: context.H3),
        Text('Text H4', style: context.H4),
        Text('Text H5', style: context.H5),
        Text('Text H6', style: context.H6),
        Text('Text P - Paragraph', style: context.p),
      ],
    );
  }

  Widget _buildLinks() {
    return FastLinkFy(
      text: 'test link https://www.google.com tap me',
      onTapLink: (v) {
        log(v);
      },
    );
  }

  Widget _buildSearchSelect() {
    return FastSearchSelect<String>(
      hint: 'search select',
      validation: (v) {
        if (v.isEmpty) {
          return 'Selecione pelo menos um item';
        }
        return null;
      },
      searchTitle: 'Pesquisar...',
      items: const ['Test 1', 'Test 2', 'Test 3', 'Test 4'],
    );
  }

  Widget _buildDropdown() {
    return FastDropDown<String>(
      items: const ['teste 1', 'teste 2', 'teste 3', 'teste 4'],
      hint: 'Selecione o numero',
      itemBuilder: (v) {
        return Row(
          children: [
            Icon(FastIcons.ant.profile),
            const SizedBox(width: 10),
            Expanded(child: Text(v.toString())),
          ],
        );
      },
    );
  }

  Widget _buildButtonGroups() {
    return FastColumn(
      xGap: 10,
      yGap: 10,
      children: [
        FastButtonGroup<String>(
          callback: (v) {},
          values: const ['Test 1', 'Test 2', 'Test 3', 'Test 4'],
          initial: const [],
        ),
        const Divider(),
        FastButtonGroup<String>(
          callback: (v) {},
          multiple: false,
          values: const ['Test 1', 'Test 2', 'Test 3', 'Test 4'],
          initial: const [],
        ),
      ],
    );
  }

  Widget _buildCalendar() {
    return const FastCalendar(rangeMode: true);
  }

  Widget _buildAudioPlayers() {
    return FastColumn(
      xGap: 10,
      yGap: 10,
      children: [
        FastAudio(
          updateState: setState,
          showProgressBar: true,
          url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
        ),
        FastAudio(
          updateState: setState,
          showProgressBar: true,
          url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3',
        ),
      ],
    );
  }

  Widget _buildDialogButton() {
    return FastButton(
      label: 'Dialog',
      onPressed: () {
        context.dialog(
          FastDialog(
            title: 'Help',
            children: [
              const Text('Dialog'),
              const Text('Dialog'),
              const Text('Dialog'),
              FastAudio(
                updateState: setState,
                url:
                    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
              ),
              FastButton(
                label: 'Cancel',
                onPressed: context.pop,
                background: Colors.red,
              ),
            ],
          ),
        );

        setState(() {});
      },
    );
  }
}
