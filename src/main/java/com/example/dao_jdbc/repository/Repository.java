package com.example.dao_jdbc.repository;

import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Repository
public class Repository {

    private final NamedParameterJdbcTemplate template;
    private static final String getProductNameScript = read("Select.sql");


    public Repository(NamedParameterJdbcTemplate template) {
        this.template = template;
    }

    private static String read(String scriptFileName) {
        try (InputStream is = new ClassPathResource(scriptFileName).getInputStream();
             BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(is))) {
            return bufferedReader.lines().collect(Collectors.joining("\n"));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public List<String> getProductName(String customersName) {
        List<String> list = new ArrayList<>();
        var set = template.queryForRowSet(getProductNameScript, Map.of("name", customersName));
        while (set.next()) {
            list.add(set.getString("product_name"));
        }
        return list;
    }

}
