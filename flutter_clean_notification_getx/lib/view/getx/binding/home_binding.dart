part of 'package:excise_notification/view/getx/controller/home_controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomHttp>(() => CustomHttp());
    Get.lazyPut<MessageRemoteDataSource>(
        () => MessageRemoteDataSourceImpl(customHttp: Get.find<CustomHttp>()));
    Get.lazyPut<MessageRepository>(() => MessageRepositoryImpl(
        messageRemoteDataSource: Get.find<MessageRemoteDataSource>()));
    Get.lazyPut<GetMessageUseCase>(() =>
        GetMessageUseCase(messageRepository: Get.find<MessageRepository>()));
    Get.lazyPut<ReadMessageUseCase>(() =>
        ReadMessageUseCase(messageRepository: Get.find<MessageRepository>()));
    Get.lazyPut<DeleteMessageUseCase>(() =>
        DeleteMessageUseCase(messageRepository: Get.find<MessageRepository>()));
    Get.lazyPut<UpdateMessageUseCase>(() =>
        UpdateMessageUseCase(messageRepository: Get.find<MessageRepository>()));
    Get.put<HomeController>(
      HomeController(
        getMessageUseCase: Get.find<GetMessageUseCase>(),
        readMessageUseCase: Get.find<ReadMessageUseCase>(),
        deleteMessageUseCase: Get.find<DeleteMessageUseCase>(),
        updateMessageUseCase: Get.find<UpdateMessageUseCase>(),
      ),
    );
  }
}
