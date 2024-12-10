import 'package:domain_trader/src/dialog_full.dart';
import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:domain_trader/src/features/core/providers/supabase_provider.dart';
import 'package:domain_trader/src/features/domains_lists/data/repositories/domain_repository_impl.dart';
import 'package:domain_trader/src/features/domains_lists/presentation/widgets/category_input.dart';
import 'package:domain_trader/src/features/domains_lists/presentation/widgets/daterange_input.dart';
import 'package:domain_trader/src/features/domains_lists/presentation/widgets/status_input.dart';
import 'package:domain_trader/src/features/users/presentation/widgets/input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditDomainPage extends ConsumerStatefulWidget {
  const EditDomainPage(this.url, {super.key});

  final String url;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditDomainPageState();
}

class _EditDomainPageState extends ConsumerState<EditDomainPage> {
  String? categoria, status, valor, _selectedOption;
  DateTime date = DateTime.now();

  final _formKey = GlobalKey<FormState>();

  final _categoryController = TextEditingController();
  final _dateController = TextEditingController();
  final _priceController = TextEditingController();

  final List<DropdownMenuEntry> listaCategory = [
    const DropdownMenuEntry(value: 'tecnol', label: 'Tecnologia'),
    const DropdownMenuEntry(value: 'nature', label: 'Natureza'),
    const DropdownMenuEntry(value: 'comerc', label: 'Comércio'),
    const DropdownMenuEntry(value: 'aprese', label: 'Apresentação'),
    const DropdownMenuEntry(value: 'viagem', label: 'Viagem'),
  ];

  Future<void> _checarDomain() async {
    final User? user = ref.read(supabaseProvider).auth.currentUser;

    if (user != null) {
      final data = await ref.read(supabaseProvider)
        .from('dominio')
        .select()
        .eq('url', widget.url)
        .single();

      setState(() {
        categoria = data['categoria'];
        status = data['status'];
        date = DateTime.parse(data['data_expiracao']);
        valor = 'R\$ ${data['preco']}';

        _categoryController.text = categoria ?? '';
        _dateController.text = DateFormat('dd/MM/yyyy').format(date);
        _selectedOption = status ?? '';
        _priceController.text = valor ?? 'R\$ ';
      });
    }
  }

  Future<void> _atualizarDados() async {
    if (_formKey.currentState?.validate() ?? false) {
      final domainRepository = DomainRepositoryImpl(supabase: ref.read(supabaseProvider));

      await domainRepository.updateDomainbyId(widget.url, _dateController.text, _selectedOption ?? '', _categoryController.text, _priceController.text);

      if (mounted) {
        Navigator.of(context).pushNamed('/home');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            showCloseIcon: true,
            content: Text('Domínio ${widget.url} modificado'),
            width: MediaQuery.of(context).size.width / 4,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(paddingPadrao / 2),
            ),
          ),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _checarDomain();
  }

  @override
  Widget build(BuildContext context) {
    return DialogFull(
      nomeDialog: 'Edição do Domínio',
      forms: [
        Column(
          children: [
            Text(
              'Digite nos campos que deseja atualizar os dados',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            Row(
              children: [
                Expanded(
                  child: InputText(
                    controller: _priceController,
                    prefixIcon: const Icon(Icons.attach_money),
                    hintText: '',
                    typeText: 'price',
                    labelText: 'Preço'
                  ),
                ),
                Expanded(child: DaterangeInput(controller: _dateController)),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: StatusInput(
                    status: const ['disponível', 'vendido', 'pausado'],
                    onSelected: (value) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        setState(() {
                          _selectedOption = value;
                        });
                      });
                    },
                  ),
                ),
                Expanded(
                  child: CategoryInput(
                    dropdownMenuEntries: listaCategory,
                    controller: _categoryController,
                  ),
                ),
              ],
            )
          ],
        )
      ],
      image: logo_domain,
      floatingActionButton: () {
        _atualizarDados();
      },
      formKey: _formKey
    );
  }
}