import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:ma_petite_voiture_mobile/backend/services/api_endpoint.dart';
import 'package:http/http.dart' as http;

mixin VoitureApiServices {
  Future ajouterVoiture(String marque, String immatriculation, int annee,
      String equipe, String nom) async {
    final response = await http.post(Uri.parse(ApiEndpoint.ajouterVoitureURL),
        headers: {'Content-Type': 'application/json'},
        body: convert.json.encode({
          'marque': marque,
          'immatriculation': immatriculation,
          'annee': annee,
          'equipe': equipe,
          'nom': nom
        }));
    if (response.statusCode == 200) {
    } else {
      debugPrint('Failed to add car');
    }
  }

  Future modifierVoiture(String id, String marque, String immatriculation,
      int annee, String equipe, String nom) async {
    final response =
        await http.put(Uri.parse('${ApiEndpoint.modifierVoitureURL}/$id'),
            headers: {'Content-Type': 'application/json'},
            body: convert.json.encode({
              'marque': marque,
              'immatriculation': immatriculation,
              'annee': annee,
              'equipe': equipe,
              'nom': nom
            }));
    if (response.statusCode == 200) {
    } else {
      debugPrint('Failed to update car');
    }
  }

  Future supprimerVoiture(String id) async {
    final response = await http.delete(
        Uri.parse('${ApiEndpoint.modifierVoitureURL}/$id'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
    } else {
      debugPrint('Failed to delete car');
    }
  }
}
