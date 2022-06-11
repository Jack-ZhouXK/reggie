/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50728
Source Host           : localhost:3306
Source Database       : reggie

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2021-07-23 10:41:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address_book
-- ----------------------------
DROP TABLE IF EXISTS `address_book`;
CREATE TABLE `address_book` (
  `id` bigint(20) NOT NULL COMMENT '����',
  `user_id` bigint(20) NOT NULL COMMENT '�û�id',
  `consignee` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '�ջ���',
  `sex` tinyint(4) NOT NULL COMMENT '�Ա� 0 Ů 1 ��',
  `phone` varchar(11) COLLATE utf8_bin NOT NULL COMMENT '�ֻ���',
  `province_code` varchar(12) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'ʡ���������',
  `province_name` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'ʡ������',
  `city_code` varchar(12) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '�м��������',
  `city_name` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '�м�����',
  `district_code` varchar(12) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '�����������',
  `district_name` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '��������',
  `detail` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '��ϸ��ַ',
  `label` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '��ǩ',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Ĭ�� 0 �� 1��',
  `create_time` datetime NOT NULL COMMENT '����ʱ��',
  `update_time` datetime NOT NULL COMMENT '����ʱ��',
  `create_user` bigint(20) NOT NULL COMMENT '������',
  `update_user` bigint(20) NOT NULL COMMENT '�޸���',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '�Ƿ�ɾ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='��ַ����';

-- ----------------------------
-- Records of address_book
-- ----------------------------
INSERT INTO `address_book` VALUES ('1417414526093082626', '1417012167126876162', 'С��', '1', '13812345678', null, null, null, null, null, null, '��ƽ���������칫¥', '��˾', '1', '2021-07-20 17:22:12', '2021-07-20 17:26:33', '1417012167126876162', '1417012167126876162', '0');
INSERT INTO `address_book` VALUES ('1417414926166769666', '1417012167126876162', 'С��', '1', '13512345678', null, null, null, null, null, null, '����', '��', '0', '2021-07-20 17:23:47', '2021-07-20 17:23:47', '1417012167126876162', '1417012167126876162', '0');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL COMMENT '����',
  `type` int(11) DEFAULT NULL COMMENT '����   1 ��Ʒ���� 2 �ײͷ���',
  `name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '��������',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '˳��',
  `create_time` datetime NOT NULL COMMENT '����ʱ��',
  `update_time` datetime NOT NULL COMMENT '����ʱ��',
  `create_user` bigint(20) NOT NULL COMMENT '������',
  `update_user` bigint(20) NOT NULL COMMENT '�޸���',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_category_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='��Ʒ���ײͷ���';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1397844263642378242', '1', '���', '1', '2021-05-27 09:16:58', '2021-07-15 20:25:23', '1', '1');
INSERT INTO `category` VALUES ('1397844303408574465', '1', '����', '2', '2021-05-27 09:17:07', '2021-06-02 14:27:22', '1', '1');
INSERT INTO `category` VALUES ('1397844391040167938', '1', '����', '3', '2021-05-27 09:17:28', '2021-07-09 14:37:13', '1', '1');
INSERT INTO `category` VALUES ('1413341197421846529', '1', '��Ʒ', '11', '2021-07-09 11:36:15', '2021-07-09 14:39:15', '1', '1');
INSERT INTO `category` VALUES ('1413342269393674242', '2', '�����ײ�', '5', '2021-07-09 11:40:30', '2021-07-09 14:43:45', '1', '1');
INSERT INTO `category` VALUES ('1413384954989060097', '1', '��ʳ', '12', '2021-07-09 14:30:07', '2021-07-09 14:39:19', '1', '1');
INSERT INTO `category` VALUES ('1413386191767674881', '2', '��ͯ�ײ�', '6', '2021-07-09 14:35:02', '2021-07-09 14:39:05', '1', '1');

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish` (
  `id` bigint(20) NOT NULL COMMENT '����',
  `name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '��Ʒ����',
  `category_id` bigint(20) NOT NULL COMMENT '��Ʒ����id',
  `price` decimal(10,2) DEFAULT NULL COMMENT '��Ʒ�۸�',
  `code` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '��Ʒ��',
  `image` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'ͼƬ',
  `description` varchar(400) COLLATE utf8_bin DEFAULT NULL COMMENT '������Ϣ',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0 ͣ�� 1 ����',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '˳��',
  `create_time` datetime NOT NULL COMMENT '����ʱ��',
  `update_time` datetime NOT NULL COMMENT '����ʱ��',
  `create_user` bigint(20) NOT NULL COMMENT '������',
  `update_user` bigint(20) NOT NULL COMMENT '�޸���',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '�Ƿ�ɾ��',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_dish_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='��Ʒ����';

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES ('1397849739276890114', '���Ӽ�', '1397844263642378242', '7800.00', '222222222', 'f966a38e-0780-40be-bb52-5699d13cb3d9.jpg', '����������ζ��С����ֵ��һ��', '1', '0', '2021-05-27 09:38:43', '2021-05-27 09:38:43', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397850140982161409', 'ë�Ϻ�����', '1397844263642378242', '6800.00', '123412341234', '0a3b3288-3446-4420-bbff-f263d0c02d8e.jpg', 'ë�Ϻ�����ë�Ϻ����⣬ȷ������һ�ݣ�', '1', '0', '2021-05-27 09:40:19', '2021-05-27 09:40:19', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397850392090947585', '�������', '1397844263642378242', '4800.00', '123412341234', '740c79ce-af29-41b8-b78d-5f49c96e38c4.jpg', '������ᣬ��ͼ���Ա����óԳ̶�', '1', '0', '2021-05-27 09:41:19', '2021-05-27 09:41:19', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397850851245600769', '������', '1397844263642378242', '12800.00', '123412341234', '057dd338-e487-4bbc-a74c-0384c44a9ca3.jpg', '����ʲô�Ȱ����𼧸���ζ���أ�', '1', '0', '2021-05-27 09:43:08', '2021-05-27 09:43:08', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397851099502260226', 'ȫ�Ҹ�', '1397844263642378242', '11800.00', '23412341234', 'a53a4e6a-3b83-4044-87f9-9d49b30a8fdc.jpg', '��������������ȫ�Ҹ��ɣ����㳤������ζ', '1', '0', '2021-05-27 09:44:08', '2021-05-27 09:44:08', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397851370462687234', '������Ѫ����', '1397844263642378242', '13800.00', '1246812345678', '2a50628e-7758-4c51-9fbb-d37c61cdacad.jpg', '������ζ�����������������߹', '1', '0', '2021-05-27 09:45:12', '2021-05-27 09:45:12', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397851668262465537', '��ζ��', '1397844263642378242', '16800.00', '1234567812345678', '0f4bd884-dc9c-4cf9-b59e-7d5958fec3dd.jpg', '���н�Ŀ����ӣ�����-��ζ�ߣ��������ղ���', '1', '0', '2021-05-27 09:46:23', '2021-05-27 09:46:23', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397852391150759938', '���Ӽ���', '1397844303408574465', '8800.00', '2346812468', 'ef2b73f2-75d1-4d3a-beea-22da0e1421bd.jpg', '���Ӽ��������Ӽ�������Զ�Ļ�', '1', '0', '2021-05-27 09:49:16', '2021-05-27 09:49:16', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397853183287013378', '������ͷ', '1397844303408574465', '19800.00', '123456787654321', '2a2e9d66-b41d-4645-87bd-95f2cfeed218.jpg', '������ͷ����ϸ�������������㣬ɫ����󣬻�ζ�Ƴ�', '1', '0', '2021-05-27 09:52:24', '2021-05-27 09:52:24', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397853709101740034', '�������', '1397844303408574465', '9800.00', '1234321234321', 'd2f61d70-ac85-4529-9b74-6d9a2255c6d7.jpg', '��ô����ʳ����', '1', '0', '2021-05-27 09:54:30', '2021-05-27 09:54:30', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397853890262118402', '������˿', '1397844303408574465', '3800.00', '1234212321234', '8dcfda14-5712-4d28-82f7-ae905b3c2308.jpg', '������˿��ֱ��������ͯ������һ������ˣ���ѧ��ʱ����������˿�Ƿ��������ᴲ�Ͽ��ŷ���磬���ˣ�������������һ����ѧ��ʱ��о�', '1', '0', '2021-05-27 09:55:13', '2021-05-27 09:55:13', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397854652581064706', '����ˮ����', '1397844303408574465', '14800.00', '2345312��345321', '1fdbfbf3-1d86-4b29-a3fc-46345852f2f8.jpg', '��Ƭ������кõ���Ƭ���ż���Ϻ������ζ��', '1', '0', '2021-05-27 09:58:15', '2021-05-27 09:58:15', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397854865672679425', '���㳴����', '1397844303408574465', '2000.00', '23456431��23456', '0f252364-a561-4e8d-8065-9a6797a6b1d3.jpg', '�����Ҳ�Ǵ�ζ����ɫ������û����ȴ����ζ', '1', '0', '2021-05-27 09:59:06', '2021-05-27 09:59:06', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397860242057375745', '��Ƥ�ն�', '1397844391040167938', '12800.00', '123456786543213456', 'e476f679-5c15-436b-87fa-8c4e9644bf33.jpeg', '���㶫��Ѽ�����㣬ȴʤ�ն�˵�Ÿԣ����»ᣩ�����ݻ��ʸ��������ƫ�ر��˷������ɼ��ն�����Ѽ������֮�����縺ʢ������Ϊ�������ձ�����ܻ�ӭ���տ���ʳ�������ġ�ɫ���죬Ƥ�����ۣ�ζ��ɿڡ�����ɫ����ʡ�Ǹ����С�����±���洦�ɼ���', '1', '0', '2021-05-27 10:20:27', '2021-05-27 10:20:27', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397860578738352129', '���м�', '1397844391040167938', '6600.00', '12345678654', '9ec6fc2d-50d2-422e-b954-de87dcd04198.jpeg', '���м���һ��ɫ��ζ��ȫ����ɫ��ͳ���ȣ��ֽа�ն����������ϵ�����е�һ�֣�ʼ���������䡣���м�ͨ��ѡ��ϸ��ũ�Ҽ���ɳ�������׵�ʳ�ģ�����������м�Ƥˬ�⻬���嵭��������������Ϫ�ƼҰ��м���������ҵ�����ʲ�Ʒ�𶦽���տ�����м����ǳ������۰ġ����˳�̳�У����Ĳ�ʽ��200���֮�࣬����Ϊ�˳�ʳ��������ǰ��м�������ʳ��������', '1', '0', '2021-05-27 10:21:48', '2021-05-27 10:21:48', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397860792492666881', '������', '1397844391040167938', '38800.00', '213456432123456', '2e96a7e3-affb-438e-b7c3-e1430df425c9.jpeg', '��ʽ������������С�����������⣬����������ۡ�֥�齴���˽Ƿ۵ȣ�����Ʒ��Ҫͨ����ʳ�ķ���̿�����տ����ɡ��������ǹ�������������ɫ�ˣ������ǡ�����ȫϯ���е��������֮һ��������Ҳ����������㶫�˼���ļ�Ʒ֮һ���ǼҼҶ��ٲ��˵�Ӧ��֮�������������˺��������پ۲�ʳ�á�', '1', '0', '2021-05-27 10:22:39', '2021-05-27 10:22:39', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397860963880316929', '��Ƥ���', '1397844391040167938', '10800.00', '1234563212345', '3fabb83a-1c09-4fd9-892b-4ef7457daafa.jpeg', '����Ƥ��롱�ǹ㶫���е�һ����ͳ���ˣ���������ϵ������Ƥ�����ۡ�ɫ�����������ζ�����ص㣬���Կ�ʹ����ǿ�������˳�������Ų�Ʒ�������յĲ��Ϸ�չ�����γ�����ը������ը���Ϳ��Ʒ��������������������������������������ڸ��Ӿ���һϵ�еļӹ����Ҵ�Ƥˮ���ټӹ����ɣ����ڵġ���Ƥ���Ƥ�����ۡ�ɫ�����������ζ������������������ַ������������̶����㸴�ӣ�����ﵽ�����Ч���������ס�', '1', '0', '2021-05-27 10:23:19', '2021-05-27 10:23:19', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397861683434139649', '�������ʺ���', '1397844391040167938', '38800.00', '1234567876543213456', '1405081e-f545-42e1-86a2-f7559ae2e276.jpeg', '���ʵĺ��ʣ���������õĴ���ʽ���ʣ����Ϊʲô�к��ʡ������ǹ�����������ַ�����ȥ���ϵ������ھ�ɽ�����������ͨ���㣬���÷�չ�������ԼҴ������ڹ������˾ͳԣ�û��̫��Ľ�������ȴ�������嵭������ʹ�������ԾȻ��⡣', '1', '0', '2021-05-27 10:26:11', '2021-05-27 10:26:11', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397862198033297410', '�ϻ�����', '1397844391040167938', '49800.00', '123456786532455', '583df4b7-a159-4cfc-9543-4f666120b25f.jpeg', '�ϻ������ֳƹ㸮�����ǹ㸮�˴�����ǧ���ʳ�������ط�������������л��ϻ�����������㣬ʱ�䳤����ȡҩ��֮Ч����ȡ���֮���� �㸮�ϻ������෱�࣬�����ø������Ϻ�������������Ƴ����ֲ�ͬ��ζ����ͬ��Ч��������', '1', '0', '2021-05-27 10:28:14', '2021-05-27 10:28:14', '1', '1', '0');
INSERT INTO `dish` VALUES ('1397862477831122945', '�����h��Ϻ', '1397844391040167938', '108800.00', '1234567865432', '5b8d2da3-3744-4bb3-acdc-329056b8259d.jpeg', '�����h��Ϻ��һ��ɫ��ζ��ȫ�Ĵ�ͳ���ˣ���������ϵ���˲�����ϺΪ���ϣ����Ը����Ƴɵ�һ��������ʳ����Ʒ���ʽ��ϸ�ۣ�ζ�������������ʺ����ߣ�֬�������ͣ�Ӫ���ḻ����ɫ��ζ��ȫ�Ĵ�ͳ���ˡ�', '1', '0', '2021-05-27 10:29:20', '2021-05-27 10:29:20', '1', '1', '0');
INSERT INTO `dish` VALUES ('1413342036832100354', '������', '1413341197421846529', '500.00', '', 'c99e0aab-3cb7-4eaa-80fd-f47d4ffea694.png', '', '1', '0', '2021-07-09 11:39:35', '2021-07-09 15:12:18', '1', '1', '0');
INSERT INTO `dish` VALUES ('1413384757047271425', '���ϼ�', '1413341197421846529', '500.00', '', '00874a5e-0df2-446b-8f69-a30eb7d88ee8.png', '', '1', '0', '2021-07-09 14:29:20', '2021-07-12 09:09:16', '1', '1', '0');
INSERT INTO `dish` VALUES ('1413385247889891330', '�׷�', '1413384954989060097', '200.00', '', 'ee04a05a-1230-46b6-8ad5-1a95b140fff3.png', '', '1', '0', '2021-07-09 14:31:17', '2021-07-11 16:35:26', '1', '1', '0');

-- ----------------------------
-- Table structure for dish_flavor
-- ----------------------------
DROP TABLE IF EXISTS `dish_flavor`;
CREATE TABLE `dish_flavor` (
  `id` bigint(20) NOT NULL COMMENT '����',
  `dish_id` bigint(20) NOT NULL COMMENT '��Ʒ',
  `name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '��ζ����',
  `value` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '��ζ����list',
  `create_time` datetime NOT NULL COMMENT '����ʱ��',
  `update_time` datetime NOT NULL COMMENT '����ʱ��',
  `create_user` bigint(20) NOT NULL COMMENT '������',
  `update_user` bigint(20) NOT NULL COMMENT '�޸���',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '�Ƿ�ɾ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='��Ʒ��ζ��ϵ��';

-- ----------------------------
-- Records of dish_flavor
-- ----------------------------
INSERT INTO `dish_flavor` VALUES ('1397849417888346113', '1397849417854791681', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-27 09:37:27', '2021-05-27 09:37:27', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397849739297861633', '1397849739276890114', '�ɿ�', '[\"��Ҫ��\",\"��Ҫ��\",\"��Ҫ���\",\"��Ҫ��\"]', '2021-05-27 09:38:43', '2021-05-27 09:38:43', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397849739323027458', '1397849739276890114', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-27 09:38:43', '2021-05-27 09:38:43', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397849936421761025', '1397849936404983809', '�ɿ�', '[\"��Ҫ��\",\"��Ҫ��\",\"��Ҫ���\",\"��Ҫ��\"]', '2021-05-27 09:39:30', '2021-05-27 09:39:30', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397849936438538241', '1397849936404983809', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-27 09:39:30', '2021-05-27 09:39:30', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397850141015715841', '1397850140982161409', '�ɿ�', '[\"��Ҫ��\",\"��Ҫ��\",\"��Ҫ���\",\"��Ҫ��\"]', '2021-05-27 09:40:19', '2021-05-27 09:40:19', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397850141040881665', '1397850140982161409', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-27 09:40:19', '2021-05-27 09:40:19', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397850392120307713', '1397850392090947585', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-27 09:41:19', '2021-05-27 09:41:19', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397850392137084929', '1397850392090947585', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-27 09:41:19', '2021-05-27 09:41:19', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397850630734262274', '1397850630700707841', '�ɿ�', '[\"��Ҫ��\",\"��Ҫ��\",\"��Ҫ���\",\"��Ҫ��\"]', '2021-05-27 09:42:16', '2021-05-27 09:42:16', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397850630755233794', '1397850630700707841', '����', '[\"΢��\",\"����\",\"����\"]', '2021-05-27 09:42:16', '2021-05-27 09:42:16', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397850851274960898', '1397850851245600769', '�ɿ�', '[\"��Ҫ��\",\"��Ҫ���\",\"��Ҫ��\"]', '2021-05-27 09:43:08', '2021-05-27 09:43:08', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397850851283349505', '1397850851245600769', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-27 09:43:08', '2021-05-27 09:43:08', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397851099523231745', '1397851099502260226', '�ɿ�', '[\"��Ҫ��\",\"��Ҫ��\",\"��Ҫ���\",\"��Ҫ��\"]', '2021-05-27 09:44:08', '2021-05-27 09:44:08', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397851099527426050', '1397851099502260226', '����', '[\"����\",\"΢��\",\"����\"]', '2021-05-27 09:44:08', '2021-05-27 09:44:08', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397851370483658754', '1397851370462687234', '�¶�', '[\"����\",\"����\",\"ȥ��\",\"�ٱ�\",\"���\"]', '2021-05-27 09:45:12', '2021-05-27 09:45:12', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397851370483658755', '1397851370462687234', '�ɿ�', '[\"��Ҫ��\",\"��Ҫ��\",\"��Ҫ���\",\"��Ҫ��\"]', '2021-05-27 09:45:12', '2021-05-27 09:45:12', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397851370483658756', '1397851370462687234', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-27 09:45:12', '2021-05-27 09:45:12', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397851668283437058', '1397851668262465537', '�¶�', '[\"����\",\"����\",\"ȥ��\",\"�ٱ�\",\"���\"]', '2021-05-27 09:46:23', '2021-05-27 09:46:23', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397852391180120065', '1397852391150759938', '�ɿ�', '[\"��Ҫ��\",\"��Ҫ���\",\"��Ҫ��\"]', '2021-05-27 09:49:16', '2021-05-27 09:49:16', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397852391196897281', '1397852391150759938', '����', '[\"����\",\"΢��\",\"����\"]', '2021-05-27 09:49:16', '2021-05-27 09:49:16', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397853183307984898', '1397853183287013378', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-27 09:52:24', '2021-05-27 09:52:24', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397853423486414850', '1397853423461249026', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-27 09:53:22', '2021-05-27 09:53:22', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397853709126905857', '1397853709101740034', '�ɿ�', '[\"��Ҫ��\",\"��Ҫ��\",\"��Ҫ���\",\"��Ҫ��\"]', '2021-05-27 09:54:30', '2021-05-27 09:54:30', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397853890283089922', '1397853890262118402', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-27 09:55:13', '2021-05-27 09:55:13', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397854133632413697', '1397854133603053569', '�¶�', '[\"����\",\"����\",\"ȥ��\",\"�ٱ�\",\"���\"]', '2021-05-27 09:56:11', '2021-05-27 09:56:11', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397854652623007745', '1397854652581064706', '�ɿ�', '[\"��Ҫ��\",\"��Ҫ��\",\"��Ҫ���\",\"��Ҫ��\"]', '2021-05-27 09:58:15', '2021-05-27 09:58:15', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397854652635590658', '1397854652581064706', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-27 09:58:15', '2021-05-27 09:58:15', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397854865735593986', '1397854865672679425', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-27 09:59:06', '2021-05-27 09:59:06', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397855742303186946', '1397855742273826817', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-27 10:02:35', '2021-05-27 10:02:35', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397855906497605633', '1397855906468245506', '�ɿ�', '[\"��Ҫ��\",\"��Ҫ��\",\"��Ҫ���\",\"��Ҫ��\"]', '2021-05-27 10:03:14', '2021-05-27 10:03:14', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397856190573621250', '1397856190540066818', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-27 10:04:21', '2021-05-27 10:04:21', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397859056709316609', '1397859056684150785', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-27 10:15:45', '2021-05-27 10:15:45', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397859277837217794', '1397859277812051969', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-27 10:16:37', '2021-05-27 10:16:37', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397859487502086146', '1397859487476920321', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-27 10:17:27', '2021-05-27 10:17:27', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397859757061615618', '1397859757036449794', '��ζ', '[\"����\",\"����\",\"����\",\"����\",\"ȫ��\"]', '2021-05-27 10:18:32', '2021-05-27 10:18:32', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397860242086735874', '1397860242057375745', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-27 10:20:27', '2021-05-27 10:20:27', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397860963918065665', '1397860963880316929', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-27 10:23:19', '2021-05-27 10:23:19', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397861135754506242', '1397861135733534722', '��ζ', '[\"����\",\"����\",\"����\",\"����\",\"ȫ��\"]', '2021-05-27 10:24:00', '2021-05-27 10:24:00', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397861370035744769', '1397861370010578945', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-27 10:24:56', '2021-05-27 10:24:56', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397861683459305474', '1397861683434139649', '�ɿ�', '[\"��Ҫ��\",\"��Ҫ��\",\"��Ҫ���\",\"��Ҫ��\"]', '2021-05-27 10:26:11', '2021-05-27 10:26:11', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397861898467717121', '1397861898438356993', '�ɿ�', '[\"��Ҫ��\",\"��Ҫ��\",\"��Ҫ���\",\"��Ҫ��\"]', '2021-05-27 10:27:02', '2021-05-27 10:27:02', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397862198054268929', '1397862198033297410', '�ɿ�', '[\"��Ҫ��\",\"��Ҫ��\",\"��Ҫ���\",\"��Ҫ��\"]', '2021-05-27 10:28:14', '2021-05-27 10:28:14', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1397862477835317250', '1397862477831122945', '����', '[\"����\",\"΢��\",\"����\"]', '2021-05-27 10:29:20', '2021-05-27 10:29:20', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398089545865015297', '1398089545676271617', '�¶�', '[\"����\",\"����\",\"ȥ��\",\"�ٱ�\",\"���\"]', '2021-05-28 01:31:38', '2021-05-28 01:31:38', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398089782323097601', '1398089782285348866', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-28 01:32:34', '2021-05-28 01:32:34', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398090003262255106', '1398090003228700673', '�ɿ�', '[\"��Ҫ��\",\"��Ҫ��\",\"��Ҫ���\",\"��Ҫ��\"]', '2021-05-28 01:33:27', '2021-05-28 01:33:27', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398090264554811394', '1398090264517062657', '�ɿ�', '[\"��Ҫ��\",\"��Ҫ��\",\"��Ҫ���\",\"��Ҫ��\"]', '2021-05-28 01:34:29', '2021-05-28 01:34:29', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398090455399837698', '1398090455324340225', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-28 01:35:14', '2021-05-28 01:35:14', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398090685449023490', '1398090685419663362', '�¶�', '[\"����\",\"����\",\"ȥ��\",\"�ٱ�\",\"���\"]', '2021-05-28 01:36:09', '2021-05-28 01:36:09', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398090825358422017', '1398090825329061889', '�ɿ�', '[\"��Ҫ��\",\"��Ҫ��\",\"��Ҫ���\",\"��Ҫ��\"]', '2021-05-28 01:36:43', '2021-05-28 01:36:43', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398091007051476993', '1398091007017922561', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-28 01:37:26', '2021-05-28 01:37:26', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398091296164851713', '1398091296131297281', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-28 01:38:35', '2021-05-28 01:38:35', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398091546531246081', '1398091546480914433', '�ɿ�', '[\"��Ҫ��\",\"��Ҫ��\",\"��Ҫ���\",\"��Ҫ��\"]', '2021-05-28 01:39:35', '2021-05-28 01:39:35', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398091729809747969', '1398091729788776450', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-28 01:40:18', '2021-05-28 01:40:18', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398091889499484161', '1398091889449152513', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-28 01:40:56', '2021-05-28 01:40:56', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398092095179763713', '1398092095142014978', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-28 01:41:45', '2021-05-28 01:41:45', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398092283877306370', '1398092283847946241', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-28 01:42:30', '2021-05-28 01:42:30', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398094018939236354', '1398094018893099009', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-28 01:49:24', '2021-05-28 01:49:24', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1398094391494094850', '1398094391456346113', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-05-28 01:50:53', '2021-05-28 01:50:53', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1399574026165727233', '1399305325713600514', '����', '[\"����\",\"΢��\",\"����\",\"����\"]', '2021-06-01 03:50:25', '2021-06-01 03:50:25', '1399309715396669441', '1399309715396669441', '0');
INSERT INTO `dish_flavor` VALUES ('1413389540592263169', '1413384757047271425', '�¶�', '[\"����\",\"���\"]', '2021-07-12 09:09:16', '2021-07-12 09:09:16', '1', '1', '0');
INSERT INTO `dish_flavor` VALUES ('1413389684020682754', '1413342036832100354', '�¶�', '[\"����\",\"���\"]', '2021-07-09 15:12:18', '2021-07-09 15:12:18', '1', '1', '0');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL COMMENT '����',
  `name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '����',
  `username` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '�û���',
  `password` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '����',
  `phone` varchar(11) COLLATE utf8_bin NOT NULL COMMENT '�ֻ���',
  `sex` varchar(2) COLLATE utf8_bin NOT NULL COMMENT '�Ա�',
  `id_number` varchar(18) COLLATE utf8_bin NOT NULL COMMENT '���֤��',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '״̬ 0:���ã�1:����',
  `create_time` datetime NOT NULL COMMENT '����ʱ��',
  `update_time` datetime NOT NULL COMMENT '����ʱ��',
  `create_user` bigint(20) NOT NULL COMMENT '������',
  `update_user` bigint(20) NOT NULL COMMENT '�޸���',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Ա����Ϣ';

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '����Ա', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '13812312312', '1', '110101199001010047', '1', '2021-05-06 17:20:07', '2021-05-10 02:24:09', '1', '1');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL COMMENT '����',
  `number` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '������',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '����״̬ 1�����2�����ͣ�3�����ͣ�4����ɣ�5��ȡ��',
  `user_id` bigint(20) NOT NULL COMMENT '�µ��û�',
  `address_book_id` bigint(20) NOT NULL COMMENT '��ַid',
  `order_time` datetime NOT NULL COMMENT '�µ�ʱ��',
  `checkout_time` datetime NOT NULL COMMENT '����ʱ��',
  `pay_method` int(11) NOT NULL DEFAULT '1' COMMENT '֧����ʽ 1΢��,2֧����',
  `amount` decimal(10,2) NOT NULL COMMENT 'ʵ�ս��',
  `remark` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '��ע',
  `phone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `consignee` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='������';

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `id` bigint(20) NOT NULL COMMENT '����',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '����',
  `image` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'ͼƬ',
  `order_id` bigint(20) NOT NULL COMMENT '����id',
  `dish_id` bigint(20) DEFAULT NULL COMMENT '��Ʒid',
  `setmeal_id` bigint(20) DEFAULT NULL COMMENT '�ײ�id',
  `dish_flavor` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '��ζ',
  `number` int(11) NOT NULL DEFAULT '1' COMMENT '����',
  `amount` decimal(10,2) NOT NULL COMMENT '���',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='������ϸ��';

-- ----------------------------
-- Records of order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for setmeal
-- ----------------------------
DROP TABLE IF EXISTS `setmeal`;
CREATE TABLE `setmeal` (
  `id` bigint(20) NOT NULL COMMENT '����',
  `category_id` bigint(20) NOT NULL COMMENT '��Ʒ����id',
  `name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '�ײ�����',
  `price` decimal(10,2) NOT NULL COMMENT '�ײͼ۸�',
  `status` int(11) DEFAULT NULL COMMENT '״̬ 0:ͣ�� 1:����',
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '����',
  `description` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '������Ϣ',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'ͼƬ',
  `create_time` datetime NOT NULL COMMENT '����ʱ��',
  `update_time` datetime NOT NULL COMMENT '����ʱ��',
  `create_user` bigint(20) NOT NULL COMMENT '������',
  `update_user` bigint(20) NOT NULL COMMENT '�޸���',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '�Ƿ�ɾ��',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_setmeal_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='�ײ�';

-- ----------------------------
-- Records of setmeal
-- ----------------------------
INSERT INTO `setmeal` VALUES ('1415580119015145474', '1413386191767674881', '��ͯ�ײ�A�ƻ�', '4000.00', '1', '', '', '61d20592-b37f-4d72-a864-07ad5bb8f3bb.jpg', '2021-07-15 15:52:55', '2021-07-15 15:52:55', '1415576781934608386', '1415576781934608386', '0');

-- ----------------------------
-- Table structure for setmeal_dish
-- ----------------------------
DROP TABLE IF EXISTS `setmeal_dish`;
CREATE TABLE `setmeal_dish` (
  `id` bigint(20) NOT NULL COMMENT '����',
  `setmeal_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '�ײ�id ',
  `dish_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '��Ʒid',
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '��Ʒ���� �������ֶΣ�',
  `price` decimal(10,2) DEFAULT NULL COMMENT '��Ʒԭ�ۣ������ֶΣ�',
  `copies` int(11) NOT NULL COMMENT '����',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '����',
  `create_time` datetime NOT NULL COMMENT '����ʱ��',
  `update_time` datetime NOT NULL COMMENT '����ʱ��',
  `create_user` bigint(20) NOT NULL COMMENT '������',
  `update_user` bigint(20) NOT NULL COMMENT '�޸���',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '�Ƿ�ɾ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='�ײͲ�Ʒ��ϵ';

-- ----------------------------
-- Records of setmeal_dish
-- ----------------------------
INSERT INTO `setmeal_dish` VALUES ('1415580119052894209', '1415580119015145474', '1397862198033297410', '�ϻ�����', '49800.00', '1', '0', '2021-07-15 15:52:55', '2021-07-15 15:52:55', '1415576781934608386', '1415576781934608386', '0');
INSERT INTO `setmeal_dish` VALUES ('1415580119061282817', '1415580119015145474', '1413342036832100354', '������', '500.00', '1', '0', '2021-07-15 15:52:55', '2021-07-15 15:52:55', '1415576781934608386', '1415576781934608386', '0');
INSERT INTO `setmeal_dish` VALUES ('1415580119069671426', '1415580119015145474', '1413385247889891330', '�׷�', '200.00', '1', '0', '2021-07-15 15:52:55', '2021-07-15 15:52:55', '1415576781934608386', '1415576781934608386', '0');

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart` (
  `id` bigint(20) NOT NULL COMMENT '����',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '����',
  `image` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'ͼƬ',
  `user_id` bigint(20) NOT NULL COMMENT '����',
  `dish_id` bigint(20) DEFAULT NULL COMMENT '��Ʒid',
  `setmeal_id` bigint(20) DEFAULT NULL COMMENT '�ײ�id',
  `dish_flavor` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '��ζ',
  `number` int(11) NOT NULL DEFAULT '1' COMMENT '����',
  `amount` decimal(10,2) NOT NULL COMMENT '���',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='���ﳵ';

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL COMMENT '����',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '����',
  `phone` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '�ֻ���',
  `sex` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '�Ա�',
  `id_number` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '���֤��',
  `avatar` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT 'ͷ��',
  `status` int(11) DEFAULT '0' COMMENT '״̬ 0:���ã�1:����',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='�û���Ϣ';
